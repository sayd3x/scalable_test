//
//  CryptoAssetsStubInteractor.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import Foundation
import RxSwift

struct CryptoAssetsStubInteractor {
    
}

extension CryptoAssetsStubInteractor: CryptoAssetsInteractor {
    func cryptoAssetsObserveAssets() -> Observable<[CryptoAssetsAsset]> {
        return Observable.never().startWith([
            CryptoAssetsAsset(id: "0", name: "Bitcoin", symbol: "BTC", usdPrice: Decimal(string: "27000")),
            CryptoAssetsAsset(id: "1", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "2", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "3", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "4", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "5", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "6", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "7", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "8", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "9", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "10", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "11", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "12", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "13", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "14", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "15", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "16", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "17", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "18", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "19", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
            CryptoAssetsAsset(id: "20", name: "Ethereum", symbol: "ETH", usdPrice: Decimal(string: "724")),
        ])
    }
    
    func cryptoAssetsFetchMore() -> Single<Void> {
        Observable.just(())
            .delay(.seconds(3), scheduler: MainScheduler.instance)
            .map{ _ in throw RxError.timeout }
            .asSingle()
    }
}
