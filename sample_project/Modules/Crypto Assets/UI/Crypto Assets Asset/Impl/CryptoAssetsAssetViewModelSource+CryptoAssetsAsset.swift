//
//  CryptoAssetsAssetViewModelSource+CryptoAssetsAsset.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation

extension CryptoAssetsAssetViewModelSource {
    init(_ asset: CryptoAssetsAsset) {
        self.init(inputName: asset.name,
                  inputSymbolName: asset.symbol,
                  inputPrice: asset.usdPrice?.shortPrice.map{ "$\($0)" })
    }
}

fileprivate extension Decimal {
    var shortPrice: String? {
        let formatter = NumberFormatter()
        return formatter.string(from: self as NSDecimalNumber)
    }
}
