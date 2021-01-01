//
//  AssetDetailsRepositoryProfile.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation

struct AssetDetailsAssetLinkObject {
    var name: String?
    var url: String?
}

struct AssetDetailsProfileObject {
    var id: String?
    var tagline: String?
    var projectDetails: String?
    var links: [AssetDetailsAssetLinkObject]?
}

