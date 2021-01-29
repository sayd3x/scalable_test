//
//  CryptoAssetsRepository.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import Foundation

protocol CryptoAssetsRepository {
    func cryptoAssetsListAssets(page: Int, limit: Int, observer: @escaping (ObservableEvent<[CryptoAssetsAssetObject]>) -> Void) -> Cancelable
}
