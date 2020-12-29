//
//  CryptoAssetsRoutable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import Foundation

protocol CryptoAssetsRoutable {
    var cryptoAssetsInteractorsFactory: CryptoAssetsInteractorsFactory? { get }
}
