//
//  CryptoAssetsRepository+Rx.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.01.2021.
//

import RxSwift

extension CryptoAssetsRepository {
    func cryptoAssetsListAssets(page: Int, limit: Int) -> Single<[CryptoAssetsAssetObject]> {
        return Observable.create{ seal in
            let c = self.cryptoAssetsListAssets(page: page, limit: limit) { event in
                seal.on(event.rxEvent)
            }
            
            return Disposables.create{
                c.cancel()
            }
        }.asSingle()
    }
}
