//
//  AssetDetailsInteractorsFactory.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import Foundation

protocol AssetDetailsInteractorsFactory {
    func createAssetDetailsInteractor() throws -> AssetDetailsInteractor
}
