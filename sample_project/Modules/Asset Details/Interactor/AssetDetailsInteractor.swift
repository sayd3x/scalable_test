//
//  AssetDetailsInteractor.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import Foundation
import RxSwift

protocol AssetDetailsInteractor {
    func observeAssetDetails() -> Observable<AssetDetailsAsset?>
    func assetDetailsObserveTimeSeries() -> Observable<AssetDetailsTimeSeries?>
}
