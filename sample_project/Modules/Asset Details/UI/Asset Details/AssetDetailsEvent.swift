//
//  AssetDetailsEvent.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import Foundation

enum AssetDetailsEvent {
    case selectedItem(_ value: AssetDetailsItem)
}

extension AssetDetailsEvent {
    var selectedItem: AssetDetailsItem? {
        switch self {
        case .selectedItem(let value):
            return value
        default:
            return nil
        }
    }
}
