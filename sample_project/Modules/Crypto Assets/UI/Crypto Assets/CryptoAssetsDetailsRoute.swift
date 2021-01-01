//
//  CryptoAssetsDetailsRoute.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation

protocol CryptoAssetsDetailsRoute {
    func cryptoAssetsOpenDetailsForAsset(_ id: String) throws
}
