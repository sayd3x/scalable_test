//
//  CryptoAssetsAsset+CryptoAssetsAssetObject.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation

extension CryptoAssetsAsset {
    init(_ assetObject: CryptoAssetsAssetObject) {
        self.init(id: assetObject.id,
                  name: assetObject.name,
                  symbol: assetObject.symbol,
                  usdPrice: assetObject.usdPrice)
    }
}
