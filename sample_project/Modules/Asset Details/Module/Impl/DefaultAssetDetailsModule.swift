//
//  DefaultAssetDetailsModule.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import Foundation
import Moya

class DefaultAssetDetailsModule: Module {
    
}

extension DefaultAssetDetailsModule: AssetDetailsModule {
    func createAssetDetailsInteractorsFactory(assetId: String) throws -> AssetDetailsInteractorsFactory {
        let plugins: [PluginType] = [
            NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
        ]
        let provider = MoyaProvider<AssetDetailsMessariNetworkApi>(plugins: plugins)
        
        
        let assetDetailsRepository = AssetDetailsMessariRepository(provider: provider,
                                                                   baseURL: URL(string: "https://data.messari.io")!)
        
        return AssetDetailsDefaultInteractorsFactory(repository: assetDetailsRepository,
                                                     assetId: assetId)
    }
}
