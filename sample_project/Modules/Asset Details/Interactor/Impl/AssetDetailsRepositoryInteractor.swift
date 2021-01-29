//
//  AssetDetailsRepositoryInteractor.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation
import RxSwift

struct AssetDetailsRepositoryInteractor {
    let repository: AssetDetailsRepository
    let assetId: String
    
    private func _observeAssetDetails() -> Observable<AssetDetailsAsset?> {
        let metrics = repository.assetDetailsGetAssetMetrics(assetId)
        let profile = repository.assetDetailsGetProfileForAsset(assetId)
        
        let assetDetails = Single.zip(metrics, profile)
            .map{ metrics, profile -> AssetDetailsAsset in
                AssetDetailsAsset(id: metrics.id,
                                  name: metrics.name,
                                  symbol: metrics.symbol,
                                  usdPrice: metrics.usdPrice,
                                  tagline: profile.tagline,
                                  projectDetails: profile.projectDetails,
                                  projectLinks: profile.links?.map{ AssetDetailsLink(name: $0.name, url: $0.url) })
            }
            .map{ AssetDetailsAsset?($0) }
        
        return Observable.of(assetDetails.asObservable(), Observable.never()).merge()
    }
}

extension AssetDetailsRepositoryInteractor: AssetDetailsInteractor {
    func assetDetailsObserveTimeSeries(_ observer: @escaping (ObservableEvent<AssetDetailsTimeSeries?>) -> Void) -> Cancelable {
        return Observable<AssetDetailsTimeSeries?>.error(AssetDetailsRepositoryInteractorError.notImplemented)
            .subscribeWithObserver(observer)
    }
    
    func observeAssetDetails(_ observer: @escaping (ObservableEvent<AssetDetailsAsset?>) -> Void) -> Cancelable {
        return _observeAssetDetails()
            .subscribeOn(MainScheduler.instance)
            .subscribeWithObserver(observer)
    }
}

enum AssetDetailsRepositoryInteractorError: Error {
    case notImplemented
}
