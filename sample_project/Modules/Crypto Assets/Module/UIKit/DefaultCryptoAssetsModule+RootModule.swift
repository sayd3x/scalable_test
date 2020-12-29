//
//  DefaultCryptoAssetsModule+RootModule.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import UIKit

enum DefaultCryptoAssetsModuleError: Error {
    case invalidStoryboard, invalidRootViewController
}

extension DefaultCryptoAssetsModule: RootModule {
    func didRegisterWithRootViewController(_ rootVC: UIViewController) throws {
        // load storyboard
        let storyboard = UIStoryboard(name: "CryptoAssets", bundle: Bundle(for: Self.self))
        guard let vc = storyboard.instantiateInitialViewController() as? CryptoAssetsViewController else {
            throw DefaultCryptoAssetsModuleError.invalidStoryboard
        }

        // configure router
        let router = CryptoAssetsRouter()
        router.setViewController(vc)
        let interactorsFactory = try self.cryptoAssetsCreateInteractorsFactory()
        router.cryptoAssetsInteractorsFactory = interactorsFactory
        
        // configure presenter
        let presenter = CryptoAssetsDefaultPresenter(interactor: try interactorsFactory.cryptoAssetsCreateInteractor())
        
        // link all together within the viewcontroller
        try vc.attachPresenter(presenter, withRouter: router)
        
        // replace root view controller
        guard let window = rootVC.view.window else {
            throw DefaultCryptoAssetsModuleError.invalidRootViewController
        }
        
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
    }
}
