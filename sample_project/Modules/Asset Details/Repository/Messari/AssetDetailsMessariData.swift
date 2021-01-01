//
//  AssetDetailsMessariData.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation

struct AssetDetailsMessariData: MessariData, Decodable {
    var id: String?
    var symbol: String?
    var name: String?
    var profile: AssetDetailsMessariProfile?
    var marketData: AssetDetailsMessariMarketDataPrice?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, profile
        case marketData = "market_data"
    }
}

struct AssetDetailsMessariProfile: Decodable {
    var general: AssetDetailsMessariProfileGeneral?
}

struct AssetDetailsMessariProfileGeneral: Decodable {
    var overview: AssetDetailsMessariProfileGeneralOverview?
}

struct AssetDetailsMessariProfileGeneralOverview: Decodable {
    var tagline: String?
    var projectDetails: String?
    var officialLinks: [AssetDetailsMessariLink]?
    
    enum CodingKeys: String, CodingKey {
        case tagline
        case projectDetails = "project_details"
        case officialLinks = "official_links"
    }
}

struct AssetDetailsMessariLink: Decodable {
    var name: String?
    var link: String?
}

struct AssetDetailsMessariMarketDataPrice: Decodable {
    var priceUsd: Double?
    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
    }
}
