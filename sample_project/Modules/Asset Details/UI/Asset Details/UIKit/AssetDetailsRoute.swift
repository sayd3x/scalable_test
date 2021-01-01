//
//  AssetDetailsRoute.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import Foundation

protocol AssetDetailsRoute {
    func openAssetDetailsWithPresenter(_ presenter: AssetDetailsPresenter,
                                       andRouter router: UIKitRouter<AssetDetailsViewController>)
}
