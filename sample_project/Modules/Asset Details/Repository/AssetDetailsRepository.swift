//
//  AssetDetailsRepository.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation
import RxSwift

protocol AssetDetailsRepository {
    func assetDetailsGetProfileForAsset(_ assetId: String) -> Single<AssetDetailsProfileObject>
    func assetDetailsGetAssetMetrics(_ assetId: String) -> Single<AssetDetailsAssetObject>
}
