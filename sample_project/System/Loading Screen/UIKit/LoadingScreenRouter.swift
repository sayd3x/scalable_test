//
//  LoadingScreenRouter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import UIKit

final class LoadingScreenRouter: UIKitRouter<UIViewController>,
                           RootModuleRoutable,
                           LoadingScreenMainRoute
{
    var rootModule: (UIModule & RootModule)?
    
}


enum LoadingScreenRouterError: Error {
    case invalidRouter
}
