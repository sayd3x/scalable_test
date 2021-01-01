//
//  AssetDetailsUrlRoute+OpenUrl.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 02.01.2021.
//

import UIKit

extension AssetDetailsUrlRoute {
    func assetDetailsOpenUrl(_ url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
