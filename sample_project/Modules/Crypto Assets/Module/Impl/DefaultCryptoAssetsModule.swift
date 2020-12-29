//
//  DefaultCryptoAssetsModule.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import Foundation

class DefaultCryptoAssetsModule: Module {
    
}

extension DefaultCryptoAssetsModule: CryptoAssetsModule {
    func cryptoAssetsCreateInteractorsFactory() throws -> CryptoAssetsInteractorsFactory {
        return CryptoAssetsDefaultInteractorsFactory()
    }
}
