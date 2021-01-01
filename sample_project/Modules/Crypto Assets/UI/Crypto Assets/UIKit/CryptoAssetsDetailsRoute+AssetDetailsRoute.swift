//
//  CryptoAssetsDetailsRoute+AssetDetailsRoute.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import Foundation

extension CryptoAssetsDetailsRoute where Self: AssetDetailsRoute & ModulesRepositoryRoutable {
    func cryptoAssetsOpenDetailsForAsset(_ id: String) throws {
        guard let detailsModule = modulesRepository?.getModule(AssetDetailsModule.self) else {
            assertionFailure("no detailsModule provided")
            return
        }
        
        let interactorsFactory = try detailsModule.createAssetDetailsInteractorsFactory(assetId: id)
        
        let presenter = AssetDetailsDefaultPresenter(interactor: try interactorsFactory.createAssetDetailsInteractor())
        let router = AssetDetailsRouter()
        
        self.openAssetDetailsWithPresenter(presenter,
                                           andRouter: router)
    }
}
