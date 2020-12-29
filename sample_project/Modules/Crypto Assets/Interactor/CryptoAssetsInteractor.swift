//
//  CryptoAssetsInteractor.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation
import RxSwift

protocol CryptoAssetsInteractor {
    func cryptoAssetsObserveAssets() -> Observable<[CryptoAssetsAsset]>
    func cryptoAssetsFetchMore() -> Single<Void>
}
