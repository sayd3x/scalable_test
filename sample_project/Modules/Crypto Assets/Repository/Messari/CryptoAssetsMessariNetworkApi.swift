//
//  CryptoAssetsNetworkApi.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import Foundation
import Moya

struct CryptoAssetsMessariNetworkApi {
    enum Target {
        case listAssets(page: Int, limit: Int? = nil)
    }

    let baseURL: URL
    let target: Target
}

extension CryptoAssetsMessariNetworkApi: TargetType {
    var path: String {
        switch target {
        case .listAssets:
            return "/api/v2/assets"
        }
    }
    
    var method: Moya.Method {
        switch target {
        case .listAssets:
            return .get
        }
    }
    
    var task: Task {
        switch target {
        case .listAssets(let page, let limit):
            return .requestParameters(
                parameters: [
                    "fields": "id,symbol,name,metrics/market_data/price_usd",
                    "page": page,
                    "limit": limit ?? 20
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
