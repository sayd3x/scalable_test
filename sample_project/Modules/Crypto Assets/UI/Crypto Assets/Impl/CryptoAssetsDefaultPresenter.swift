//
//  CryptoAssetsDefaultPresenter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation
import RxSwift
import RxCocoa

fileprivate struct MasterSource {
    let items = BehaviorSubject<[CryptoAssetsItem]>(value: [])
    let lastItem = BehaviorSubject<CryptoAssetsItem>(value: .pageLoadingTrigger)
    let event = PublishRelay<CryptoAssetsEvent>()
}

fileprivate struct ViewModelSource: CryptoAssetsViewModel {
    let inputItems: Driver<[CryptoAssetsItem]>
    let outputEvent: PublishRelay<CryptoAssetsEvent>
}

class CryptoAssetsDefaultPresenter: CryptoAssetsPresenter.Rx {
    private let masterSource = MasterSource()
    private let interactor: CryptoAssetsInteractor
    
    override func createViewModel() -> CryptoAssetsViewModel? {
        let assets = interactor.cryptoAssetsObserveAssets()
            .map{ assets in
                assets
                    .filter{ $0.id != nil }
                    .map{ CryptoAssetsItem.asset($0.id!, CryptoAssetsAssetViewModelSource($0)) }
            }

        Observable.combineLatest(assets, masterSource.lastItem)
            .map() { assets, lastItem in
                assets + [lastItem]
            }
            .bind(to: masterSource.items)
            .disposed(by: disposeBag)
        
        masterSource.event
            .filter{ $0.bare == .fetchMore }
            .do(onNext: { [unowned self] _ in
                masterSource.lastItem.onNext(.pageLoading)
            })
            .flatMapLatest{ [unowned self] _ in
                self.interactor.cryptoAssetsFetchMore()
                    .asObservable()
                    .materialize()
                    .map{ $0.error }
            }
            .do(onNext: { [unowned self] _ in
                masterSource.lastItem.onNext(.pageLoadingTrigger)
            })
            .asDriver(onErrorJustReturn: nil)
            .filter{ $0 != nil }
            .map{ $0! }
            .do(onNext: { [unowned self] error in
                let model = CryptoAssetsPageLoadingErrorViewModelSource(inputTitle: "Error: \(error.localizedDescription)",
                                                                        inputSubtitle: "Tap to refresh")
                masterSource.lastItem.onNext(.pageLoadingError(model))
            })
//            .drive(onNext: { [unowned self] error in
//                self.router?.cryptoAssetsShowAlertWithError(error)
//            })
            .drive()
            .disposed(by: disposeBag)

        masterSource.event
            .filter{ $0.selectedItem?.reload ?? false }
            .map{ _ in CryptoAssetsItem.pageLoadingTrigger }
            .bind(to: masterSource.lastItem)
            .disposed(by: disposeBag)
        
        masterSource.event
            .map{ $0.selectedItem?.assetId }
            .filter{ $0 != nil }
            .asDriver(onErrorJustReturn: nil)
            .filter{ $0 != nil }
            .map{ $0! }
            .drive(onNext: { [unowned self] assetId in
                try? self.router?.cryptoAssetsOpenDetailsForAsset(assetId)
            })
            .disposed(by: disposeBag)
        
        
        return ViewModelSource(inputItems: masterSource.items.asDriver(onErrorJustReturn: []),
                               outputEvent: masterSource.event)
    }
    
    init(interactor: CryptoAssetsInteractor) {
        self.interactor = interactor
    }
}

