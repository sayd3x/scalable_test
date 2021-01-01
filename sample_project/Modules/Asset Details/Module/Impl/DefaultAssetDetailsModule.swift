//
//  DefaultAssetDetailsModule.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import Foundation

class DefaultAssetDetailsModule: Module {
    
}

extension DefaultAssetDetailsModule: AssetDetailsModule {
    func createAssetDetailsInteractorsFactory(assetId: String) throws -> AssetDetailsInteractorsFactory {
        return AssetDetailsDefaultInteractorsFactory(assetId: assetId)
    }
}
