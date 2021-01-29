//
//  AssetDetailsMessariRepository.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation
import Moya
import RxMoya
import RxSwift

struct AssetDetailsMessariRepository {
    let provider: MoyaProvider<AssetDetailsMessariNetworkApi>
    let baseURL: URL
    
    
    private func _assetDetailsGetAssetMetrics(_ assetId: String) -> Single<AssetDetailsAssetObject> {
        let apiTarget = AssetDetailsMessariNetworkApi(baseURL: baseURL,
                                                      target: .getMetrics(assetId))
        
        return provider.rx.requestMessariData(AssetDetailsMessariData.self,
                                              target: apiTarget)
            .map{ $0.data! }
            .map { AssetDetailsAssetObject(id: $0.id,
                                           name: $0.name,
                                           symbol: $0.symbol,
                                           usdPrice: $0.marketData?.priceUsd.map{ Decimal($0) })
            }
    }
    
    private func _assetDetailsGetProfileForAsset(_ assetId: String) -> Single<AssetDetailsProfileObject> {
        let apiTarget = AssetDetailsMessariNetworkApi(baseURL: baseURL,
                                                      target: .getProfile(assetId))
        
        return provider.rx.requestMessariData(AssetDetailsMessariData.self,
                                              target: apiTarget)
            .map{ ($0.data?.profile?.general?.overview)! }
            .map{ AssetDetailsProfileObject(id: assetId,
                                            tagline: $0.tagline,
                                            projectDetails: $0.projectDetails,
                                            links: $0.officialLinks?.map{ AssetDetailsAssetLinkObject(name: $0.name, url: $0.link) })
            }
    }
}

extension AssetDetailsMessariRepository: AssetDetailsRepository {
    func assetDetailsGetAssetMetrics(_ assetId: String, observer: @escaping (ObservableEvent<AssetDetailsAssetObject>) -> Void) -> Cancelable {
        return _assetDetailsGetAssetMetrics(assetId)
            .asObservable()
            .subscribeWithObserver(observer)
    }
    
    func assetDetailsGetProfileForAsset(_ assetId: String, observer: @escaping (ObservableEvent<AssetDetailsProfileObject>) -> Void) -> Cancelable {
        return _assetDetailsGetProfileForAsset(assetId)
            .asObservable()
            .subscribeWithObserver(observer)
    }
}
