//
//  AssetDetailsDefaultInteractorsFactory.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import Foundation

struct AssetDetailsDefaultInteractorsFactory {
    let repository: AssetDetailsRepository
    let assetId: String
}

extension AssetDetailsDefaultInteractorsFactory: AssetDetailsInteractorsFactory {
    func createAssetDetailsInteractor() throws -> AssetDetailsInteractor {
        return AssetDetailsRepositoryInteractor(repository: repository,
                                                assetId: assetId)
    }
}
