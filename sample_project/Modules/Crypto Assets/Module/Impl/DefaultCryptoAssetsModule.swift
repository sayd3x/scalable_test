//
//  DefaultCryptoAssetsModule.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import Foundation
import Moya

class DefaultCryptoAssetsModule: Module {
    var modulesRepository: ModulesRepository!
}

extension DefaultCryptoAssetsModule: CryptoAssetsModule {
    func cryptoAssetsCreateInteractorsFactory() throws -> CryptoAssetsInteractorsFactory {
        let plugins: [PluginType] = [
            NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
        ]
        let provider = MoyaProvider<CryptoAssetsMessariNetworkApi>(plugins: plugins)
        
        
        let assetsRepository = CryptoAssetsMessariRepository(provider: provider,
                                                             baseURL: URL(string: "https://data.messari.io")!)

        return CryptoAssetsDefaultInteractorsFactory(repository: assetsRepository)
    }
}

extension DefaultCryptoAssetsModule: RepositoryModule {
    func didRegisterWithModulesRepository(_ modulesRepository: ModulesRepository) throws {
        self.modulesRepository = modulesRepository
    }
}
