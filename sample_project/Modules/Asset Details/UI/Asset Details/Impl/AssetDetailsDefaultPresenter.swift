//
//  AssetDetailsDefaultPresenter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import Foundation
import RxSwift
import RxCocoa

fileprivate struct MasterSource {
    let title = BehaviorSubject<String?>(value: nil)
    let section = BehaviorSubject<AssetDetailsSection>(value: AssetDetailsSection(header: nil, items: []))
    let event = PublishRelay<AssetDetailsEvent>()
}

fileprivate struct ViewModelSource: AssetDetailsViewModel {
    var inputTitle: Driver<String?>
    var inputSection: Driver<AssetDetailsSection>
    var outputEvent: PublishRelay<AssetDetailsEvent>
}

class AssetDetailsDefaultPresenter: AssetDetailsPresenter.Rx {
    private let masterSource = MasterSource()
    private let interactor: AssetDetailsInteractor
    
    override func createViewModel() -> AssetDetailsViewModel? {
        // Display asset details
        
        let details = interactor.observeAssetDetails().share(replay: 1)
        
        let descriptionItems = details
            .map{ $0?.projectDetails }
            .map{ [AssetDetailsItem.description(AssetDetailsDescriptionViewModelSource(inputDescription: $0))] }
        
        let linkItems = details
            .map{ $0?.projectLinks }
            .map{ links -> [AssetDetailsItem] in
                links?
                    .filter{ $0.url != nil }
                    .map{ AssetDetailsItem.reference($0.url!, AssetDetailsRefViewModelSource(inputTitle: $0.name)) }
                    ?? []
            }

        let items = Observable.zip(descriptionItems, linkItems).map{ $0 + $1 }
        
        let headerItem = details
            .map{ details in
                AssetDetailsHeaderViewModelSource(inputTitle: details?.name,
                                                  inputPrice: details?.usdPrice?.shortPrice.map{ "$\($0)" },
                                                  inputShortDescription: details?.tagline)
            }
        
        Observable.zip(headerItem, items)
            .map{ AssetDetailsSection(header: $0, items: $1) }
            .bind(to: masterSource.section)
            .disposed(by: disposeBag)
        
        details
            .map{ $0?.symbol }
            .bind(to: masterSource.title)
            .disposed(by: disposeBag)
        
        
        // Process events
        
        masterSource.event
            .filter{ $0.selectedItem?.referenceUrl != nil }
            .map{ $0.selectedItem?.referenceUrl }
            .asDriver(onErrorJustReturn: nil)
            .filter{ $0 != nil }
            .map{ $0! }
            .drive(onNext: { [unowned self] urlString in
                self.router?.assetDetailsOpenUrl(urlString)
            })
            .disposed(by: disposeBag)
        
        return ViewModelSource(inputTitle: masterSource.title.asDriver(onErrorJustReturn: nil),
                               inputSection: masterSource.section.asDriver(onErrorJustReturn: AssetDetailsSection(header: nil, items: [])),
                               outputEvent: masterSource.event)
    }
    
    init(interactor: AssetDetailsInteractor) {
        self.interactor = interactor
    }
}
