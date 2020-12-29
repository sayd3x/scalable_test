//
//  CryptoAssetsAlertRoute+AlertRoute.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import Foundation

extension CryptoAssetsAlertRoute where Self: AlertRoute {
    func cryptoAssetsShowAlertWithError(_ error: Error) {
        self.showAlert("Error", withMessage: error.localizedDescription)
    }
}
