//
//  CryptoAssetsInteractor+Rx.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.01.2021.
//

import RxSwift

extension CryptoAssetsInteractor {
    func cryptoAssetsObserveAssets() -> Observable<[CryptoAssetsAsset]> {
        return Observable.create { seal -> Disposable in
            let c = self.cryptoAssetsObserveAssets { event in
                seal.on(event.rxEvent)
            }
            
            return Disposables.create {
                c.cancel()
            }
        }
    }
    
    func cryptoAssetsFetchMore() -> Completable {
        return Completable.create { seal -> Disposable in
            let c = self.cryptoAssetsFetchMore { result in
                seal(result.rxEvent)
            }
            return Disposables.create {
                c.cancel()
            }
        }
    }
}
