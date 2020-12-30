//
//  AssetDetailsViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import UIKit
import RxSwift
import RxCocoa

class AssetDetailsViewController: RxViewController, PresenterCompatible {
    @IBOutlet var tableView: UITableView!
    
    private let cellStore = TableViewCellStore()
    private let headerModel = BehaviorRelay<AssetDetailsHeaderViewModel?>(value: nil)
    let presenterConfigurator = PresenterConfigurator<AssetDetailsViewModel, AssetDetailsRoutes>()
    
    override func bindViewModel() {
        super.bindViewModel()
        
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = viewModel?.inputTitle
        navigationItem.backButtonTitle = ""
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.layoutMargins.left = 24
        tableView.layoutMargins.right = 24

        tableView.register(AssetDetailsRefTableViewCell.self)
        tableView.register(AssetDetailsDescriptionTableViewCell.self)
        tableView.register(AssetDetailsTableViewHeaderFooterView.self)
        
        viewModel?.inputSection
            .map{ $0.header }
            .drive(headerModel)
            .disposed(by: disposeBag)
        
        viewModel?.inputSection
            .map{ $0.items }
            .drive(tableView.rx.items) { (tableView, row, element) in
                switch element {
                case .description(let model):
                    let cell = tableView.dequeueReusableCell(AssetDetailsDescriptionTableViewCell.self,
                                                             forIndexPath: IndexPath(row: row, section: 0))
                    cell.attachViewModel(model)
                    return cell
                case .reference(_, let model):
                    let cell = tableView.dequeueReusableCell(AssetDetailsRefTableViewCell.self,
                                                             forIndexPath: IndexPath(row: row, section: 0))
                    cell.attachViewModel(model)
                    return cell
                }
            }
            .disposed(by: disposeBag)
        
        Driver.zip(tableView.rx.itemSelected.asDriver(),
                   tableView.rx.modelSelected(AssetDetailsItem.self).asDriver())
            .drive(onNext: { [unowned self] index, item in
                self.tableView.deselectRow(at: index, animated: false)
                self.viewModel?.outputEvent.accept(.selectedItem(item))
            })
            .disposed(by: disposeBag)
    }
    
}

extension AssetDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item: AssetDetailsItem = try! tableView.rx.model(at: indexPath)
        
        switch item {
        case .description(let model):
            return tableView.heightOfCell(AssetDetailsDescriptionTableViewCell.self,
                                          fromStore: cellStore,
                                          forModel: model)
        case .reference:
            return 44
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let model = headerModel.value, section == 0 else {
            return nil
        }
                
        let view = tableView.dequeueReusableHeaderFooterView(AssetDetailsTableViewHeaderFooterView.self)
        view.attachViewModel(model)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let model = headerModel.value, section == 0 else {
            return 0
        }
        
        return tableView.heightOfCell(AssetDetailsTableViewHeaderFooterView.self,
                                      fromStore: cellStore,
                                      forModel: model)
    }
}
