//
//  AssetDetailsInteractor+Rx.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.01.2021.
//

import RxSwift

extension AssetDetailsInteractor {
    func observeAssetDetails() -> Observable<AssetDetailsAsset?> {
        return Observable.create { seal -> Disposable in
            let c = self.observeAssetDetails { event in
                seal.on(event.rxEvent)
            }
            
            return Disposables.create{
                c.cancel()
            }
        }
    }
    
    func assetDetailsObserveTimeSeries() -> Observable<AssetDetailsTimeSeries?> {
        return Observable.create { seal -> Disposable in
            let c = self.assetDetailsObserveTimeSeries { event in
                seal.on(event.rxEvent)
            }
            
            return Disposables.create{
                c.cancel()
            }
        }
    }
}
