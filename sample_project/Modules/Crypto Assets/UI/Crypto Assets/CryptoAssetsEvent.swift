//
//  CryptoAssetsEvent.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation

enum CryptoAssetsEvent {
    enum Bare {
        case fetchMore, reload
    }
    case bare(_ value: Bare)
    case selectedItem(_ value: CryptoAssetsItem)
}

extension CryptoAssetsEvent {
    var bare: Bare? {
        switch self {
        case .bare(let value):
            return value
        default:
            return nil
        }
    }
    
    var selectedItem: CryptoAssetsItem? {
        switch self {
        case .selectedItem(let value):
            return value
        default:
            return nil
        }
    }

}
