//
//  Decimal+ShortPrice.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import Foundation

extension Decimal {
    var shortPriceUsd: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter.string(from: self as NSDecimalNumber)
    }
}
