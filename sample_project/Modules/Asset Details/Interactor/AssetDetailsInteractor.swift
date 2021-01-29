//
//  AssetDetailsInteractor.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import Foundation

protocol AssetDetailsInteractor {
    func observeAssetDetails(_ observer: @escaping (ObservableEvent<AssetDetailsAsset?>) -> Void) -> Cancelable
    func assetDetailsObserveTimeSeries(_ observer: @escaping (ObservableEvent<AssetDetailsTimeSeries?>) -> Void) -> Cancelable
    
}
