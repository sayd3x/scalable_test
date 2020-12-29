//
//  CryptoAssetsItem.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation

enum CryptoAssetsItem {
    case asset(_ id: String, _ model: CryptoAssetsAssetViewModel)
    case pageLoading
    case pageLoadingTrigger
    case pageLoadingError(_ model: CryptoAssetsPageLoadingErrorViewModel)
}

extension CryptoAssetsItem {
    var assetId: String? {
        switch self {
        case .asset(let id, _):
            return id
        default:
            return nil
        }
    }
    
    var reload: Bool {
        switch self {
        case .pageLoadingError:
            return true
        default:
            return false
        }
    }
}
