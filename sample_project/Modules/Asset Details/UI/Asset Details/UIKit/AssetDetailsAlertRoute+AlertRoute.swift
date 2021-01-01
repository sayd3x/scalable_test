//
//  AssetDetailsAlertRoute+AlertRoute.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 02.01.2021.
//

import Foundation

extension AssetDetailsAlertRoute where Self: AlertRoute {
    func assetDetailsShowAlert(_ error: Error) {
        self.showAlert("Error", withMessage: error.localizedDescription)
    }
}
