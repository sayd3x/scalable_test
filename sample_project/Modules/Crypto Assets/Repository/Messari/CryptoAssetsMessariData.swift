//
//  CryptoAssetsMessariData.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation

struct CryptoAssetsMessariData {
    var id: String?
    var symbol: String?
    var name: String?
    var metrics: CryptoAssetsMessariMetrics?
}

struct CryptoAssetsMessariMetrics {
    var marketData: CryptoAssetsMessariMarketDataPrice?
}

struct CryptoAssetsMessariMarketDataPrice {
    var priceUsd: Double?
}

extension CryptoAssetsMessariData: MessariData & Decodable {}

extension CryptoAssetsMessariMetrics: Decodable {
    enum CodingKeys: String, CodingKey {
        case marketData = "market_data"
    }
}

extension CryptoAssetsMessariMarketDataPrice: Decodable {
    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
    }
}
