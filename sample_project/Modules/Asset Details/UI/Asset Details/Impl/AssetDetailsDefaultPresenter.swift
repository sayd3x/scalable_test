//
//  AssetDetailsDefaultPresenter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import Foundation
import RxSwift
import RxRelay

fileprivate struct MasterSource {
    let title = BehaviorSubject<String?>(value: nil)
    let section = BehaviorSubject<AssetDetailsSection>(value: AssetDetailsSection(header: nil, items: []))
    let event = PublishRelay<AssetDetailsEvent>()
}

fileprivate struct ViewModelSource: AssetDetailsViewModel {
    var inputTitle: Observable<String?>
    var inputSection: Observable<AssetDetailsSection?>
    var outputEvent: PublishRelay<AssetDetailsEvent>
    
    func observeTitle(_ observer: @escaping (ObservableEvent<String?>) -> Void) -> Cancelable {
        return inputTitle.subscribe { event in
            observer(event.observableEvent)
        }.cancelable
    }
    
    func observeSection(_ observer: @escaping (ObservableEvent<AssetDetailsSection?>) -> Void) -> Cancelable {
        return inputSection.subscribe { event in
            observer(event.observableEvent)
        }.cancelable
    }
    
    func onEvent(_ event: AssetDetailsEvent) {
        outputEvent.accept(event)
    }
}

class AssetDetailsDefaultPresenter: AssetDetailsPresenter.Rx {
    private let masterSource = MasterSource()
    private let interactor: AssetDetailsInteractor
    
    override func createViewModel() -> AssetDetailsViewModel? {
        let progress = BehaviorSubject<Bool>(value: true)

        progress
            .observeOn(MainScheduler.asyncInstance)
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { [unowned self] show in
                self.router?.assetDetailsShowProgressActivity(show)
            })
            .disposed(by: disposeBag)
        
        // Display asset details
        let materializedDetails = interactor.observeAssetDetails().materialize().share(replay: 1)
        
        materializedDetails.map{ $0.error }
            .asDriver(onErrorJustReturn: nil)
            .filter{ $0 != nil }
            .map{ $0! }
            .drive(onNext: { [unowned self] error in
                self.router?.assetDetailsShowAlert(error)
            })
            .disposed(by: disposeBag)
            

        let details = materializedDetails.map{ $0.element ?? nil }
        
        details.map{ _ in false }
            .bind(to: progress)
            .disposed(by: disposeBag)
        
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
                                                  inputPrice: details?.usdPrice?.shortPriceUsd,
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
        
        
        return ViewModelSource(inputTitle: masterSource.title,
                               inputSection: masterSource.section.map{ AssetDetailsSection?($0)},
                               outputEvent: masterSource.event)
    }
    
    init(interactor: AssetDetailsInteractor) {
        self.interactor = interactor
    }
}
