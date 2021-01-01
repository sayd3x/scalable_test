//
//  AssetDetailsMessariNetworkApi.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation
import Moya

struct AssetDetailsMessariNetworkApi {
    enum Target {
        case getMetrics(_ assetId: String)
        case getProfile(_ assetId: String)
    }

    let baseURL: URL
    let target: Target
}

extension AssetDetailsMessariNetworkApi: TargetType {
    var path: String {
        switch target {
        case .getMetrics(let assetKey):
            return "/api/v1/assets/\(assetKey)/metrics"
        case .getProfile(let assetKey):
            return "/api/v2/assets/\(assetKey)/profile"
        }
    }
    
    var method: Moya.Method {
        switch target {
        case .getMetrics:
            return .get
        case .getProfile:
            return .get
        }
    }
    
    var task: Task {
        switch target {
        case .getMetrics:
            return .requestParameters(
                parameters: [
                    "fields": "id,symbol,name,market_data/price_usd"
                ],
                encoding: URLEncoding.queryString)
        case .getProfile:
            return .requestParameters(
                parameters: [
                    "fields": "profile/general/overview/tagline,profile/general/overview/project_details,profile/general/overview/official_links"
                ],
                encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        return nil
    }

    var sampleData: Data {
        return Data()
    }
}
