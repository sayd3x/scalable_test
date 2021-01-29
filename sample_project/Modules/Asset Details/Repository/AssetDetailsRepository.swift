//
//  AssetDetailsRepository.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation

protocol AssetDetailsRepository {
    func assetDetailsGetProfileForAsset(_ assetId: String, observer: @escaping (ObservableEvent<AssetDetailsProfileObject>) -> Void) -> Cancelable
    func assetDetailsGetAssetMetrics(_ assetId: String, observer: @escaping (ObservableEvent<AssetDetailsAssetObject>) -> Void) -> Cancelable
}
