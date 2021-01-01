//
//  AssetDetailsProgressActivityRoute+AssetDetailsViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 02.01.2021.
//

import Foundation

extension AssetDetailsProgressActivityRoute where Self: Router, Self.ViewController == AssetDetailsViewController {
    func assetDetailsShowProgressActivity(_ show: Bool) {
        viewController?.showProgressActivityView(show)
    }
}
