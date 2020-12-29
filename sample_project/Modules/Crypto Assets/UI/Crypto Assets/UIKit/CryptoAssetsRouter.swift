//
//  CryptoAssetsRouter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import Foundation

final class CryptoAssetsRouter: UIKitRouter<CryptoAssetsViewController>,
                                ModulesRepositoryRoutable,
                                CryptoAssetsRoutable,
                                AlertRoute,
                                CryptoAssetsRoutes {
    
    var modulesRepository: ModulesRepository?
    var cryptoAssetsInteractorsFactory: CryptoAssetsInteractorsFactory?
}
