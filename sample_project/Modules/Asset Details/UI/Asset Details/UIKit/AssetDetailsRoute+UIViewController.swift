//
//  AssetDetailsRoute+UIViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import UIKit

extension AssetDetailsRoute where Self: Router, Self.ViewController: UIViewController {
    func openAssetDetailsWithPresenter(_ presenter: AssetDetailsPresenter,
                                       andRouter router: UIKitRouter<AssetDetailsViewController>) {
        viewController?.performSegue(withIdentifier: "toAssetDetailsVC",
                                     sender: segueSenderFor(AssetDetailsViewController.self,
                                                            withPresenter: presenter,
                                                            andRouter: router))
    }
}
