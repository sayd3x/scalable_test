//
//  AssetDetailsAsset.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import Foundation

struct AssetDetailsLink {
    var name: String?
    var url: String?
}

struct AssetDetailsAsset {
    var name: String?
    var symbol: String?
    var usdPrice: Decimal?
    var tagline: String?
    var projectDetails: String?
    var projectLinks: [AssetDetailsLink]?
}

