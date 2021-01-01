//
//  CryptoAssetsViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class CryptoAssetsViewController: RxViewController, PresenterCompatible {
    @IBOutlet var tableView: UITableView!
    
    let presenterConfigurator = PresenterConfigurator<CryptoAssetsViewModel, CryptoAssetsRoutes>()

    override func bindViewModel() {
        super.bindViewModel()
        
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Assets"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.layoutMargins.left = 24
        tableView.layoutMargins.right = 24

        tableView.register(CryptoAssetsAssetTableViewCell.self)
        tableView.register(CryptoAssetsPageLoadingTableViewCell.self)
        tableView.register(CryptoAssetsPageLoadingErrorTableViewCell.self)
        
        viewModel?.inputItems
            .drive(tableView.rx.items) { (tableView, row, element) in
                switch element {
                case .asset(_, let model):
                    let cell = tableView.dequeueReusableCell(CryptoAssetsAssetTableViewCell.self,
                                                             forIndexPath: IndexPath(row: row, section: 0))
                    cell.attachViewModel(model)
                    return cell
                case .pageLoadingError(let model):
                    let cell = tableView.dequeueReusableCell(CryptoAssetsPageLoadingErrorTableViewCell.self,
                                                             forIndexPath: IndexPath(row: row, section: 0))
                    cell.attachViewModel(model)
                    return cell
                case .pageLoading:
                    let cell = tableView.dequeueReusableCell(CryptoAssetsPageLoadingTableViewCell.self,
                                                             forIndexPath: IndexPath(row: row, section: 0))
                    cell.activityIndicator.startAnimating()
                    return cell
                case .pageLoadingTrigger:
                    return UITableViewCell()
                }
            }
            .disposed(by: disposeBag)
        
        Driver.zip(tableView.rx.itemSelected.asDriver(),
                   tableView.rx.modelSelected(CryptoAssetsItem.self).asDriver())
            .drive(onNext: { [unowned self] index, item in
                self.tableView.deselectRow(at: index, animated: false)
                self.viewModel?.outputEvent.accept(.selectedItem(item))
            })
            .disposed(by: disposeBag)
    }
    
    
}

extension CryptoAssetsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item: CryptoAssetsItem = try! tableView.rx.model(at: indexPath)
        
        switch item {
        case .asset:
            return 50
        case .pageLoadingError:
            return 80
        case .pageLoadingTrigger:
            return 80
        case .pageLoading:
            return 80
        }

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let item: CryptoAssetsItem = try! tableView.rx.model(at: indexPath)
        switch item {
        case .pageLoadingTrigger:
            // trigger update
            DispatchQueue.main.async {
                self.viewModel?.outputEvent.accept(.bare(.fetchMore))
            }
            break
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}
