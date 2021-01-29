//
//  CryptoAssetsMoyaRepository.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import Foundation
import Moya
import RxMoya
import RxSwift

struct CryptoAssetsMessariRepository {
    let provider: MoyaProvider<CryptoAssetsMessariNetworkApi>
    let baseURL: URL
}

extension CryptoAssetsMessariRepository: CryptoAssetsRepository {
    private func _cryptoAssetsListAssets(page: Int, limit: Int) -> Single<[CryptoAssetsAssetObject]> {
        let apiTarget = CryptoAssetsMessariNetworkApi(baseURL: baseURL,
                                                      target: .listAssets(page: page, limit: limit))
        
        return provider.rx.requestMessariData([CryptoAssetsMessariData].self,
                                              target: apiTarget)
            .map{ $0.data!.map { CryptoAssetsAssetObject(id: $0.id,
                                          name: $0.name,
                                          symbol: $0.symbol,
                                          usdPrice: $0.metrics?.marketData?.priceUsd.map{ Decimal($0) }) }
            }
    }
    
    func cryptoAssetsListAssets(page: Int, limit: Int, observer: @escaping (ObservableEvent<[CryptoAssetsAssetObject]>) -> Void) -> Cancelable {
        return _cryptoAssetsListAssets(page: page, limit: limit)
            .asObservable()
            .subscribeWithObserver(observer)
    }
}
