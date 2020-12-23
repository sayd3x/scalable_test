//
//  LoadingScreenMainRoute+RootModuleRoutable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import UIKit

extension LoadingScreenMainRoute where Self: UIKitRouter<UIViewController> & RootModuleRoutable
{
    func showMainScreen() throws {
        guard let rootVC = self.viewController, let module = self.rootModule else {
            throw LoadingScreenRouterError.invalidRouter
        }
        
        try module.didRegisterWithRootViewController(rootVC)
    }
}
