//
//  CryptoAssetsDefaultInteractorsFactory.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import Foundation

struct CryptoAssetsDefaultInteractorsFactory {
    
}

extension CryptoAssetsDefaultInteractorsFactory: CryptoAssetsInteractorsFactory {
    func cryptoAssetsCreateInteractor() throws -> CryptoAssetsInteractor {
        return CryptoAssetsStubInteractor()
    }
}
