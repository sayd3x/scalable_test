//
//  AssetDetailsModule.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import Foundation

protocol AssetDetailsModule {
    func createAssetDetailsInteractorsFactory(assetId: String) throws -> AssetDetailsInteractorsFactory
}
