//
//  CryptoAssetsInteractorsFactory.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import Foundation

protocol CryptoAssetsInteractorsFactory {
    func cryptoAssetsCreateInteractor() throws -> CryptoAssetsInteractor
}
