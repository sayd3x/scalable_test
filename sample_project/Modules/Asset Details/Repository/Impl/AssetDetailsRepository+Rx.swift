//
//  AssetDetailsRepository+Rx.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.01.2021.
//

import RxSwift

extension AssetDetailsRepository {
    func assetDetailsGetProfileForAsset(_ assetId: String) -> Single<AssetDetailsProfileObject> {
        return Observable.create { seal -> Disposable in
            let c = self.assetDetailsGetProfileForAsset(assetId) { event in
                seal.on(event.rxEvent)
            }
            
            return Disposables.create{
                c.cancel()
            }
        }.asSingle()
    }
    
    func assetDetailsGetAssetMetrics(_ assetId: String) -> Single<AssetDetailsAssetObject> {
        return Observable.create { seal -> Disposable in
            let c = self.assetDetailsGetAssetMetrics(assetId) { event in
                seal.on(event.rxEvent)
            }
            
            return Disposables.create{
                c.cancel()
            }
        }.asSingle()
    }
}
