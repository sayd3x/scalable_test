//
//  CryptoAssetsInteractor.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation

protocol CryptoAssetsInteractor {
    func cryptoAssetsObserveAssets(_ observer: @escaping (ObservableEvent<[CryptoAssetsAsset]>) -> Void) -> Cancelable
    func cryptoAssetsFetchMore(_ observer: @escaping (Result<Void,Error>) -> Void) -> Cancelable
}
