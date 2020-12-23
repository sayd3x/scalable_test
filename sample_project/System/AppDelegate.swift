//
//  AppDelegate.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var rootModule: DefaultRepositoryModule!
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        rootModule = try! DefaultRepositoryModule()

        let window = UIWindow()
        
        let loadingVC = UIStoryboard(name: "LoadingScreen", bundle: nil).instantiateInitialViewController() as! LoadingScreenViewController
        
        let router = LoadingScreenRouter()
        router.setViewController(loadingVC)
        router.rootModule = rootModule
        
        loadingVC.router = router
        window.rootViewController = loadingVC
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }

}

