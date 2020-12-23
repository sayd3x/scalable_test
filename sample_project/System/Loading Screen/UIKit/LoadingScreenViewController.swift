//
//  LoadingScreenViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import UIKit

class LoadingScreenViewController: UIViewController {
    var router: LoadingScreenMainRoute!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        try! router.showMainScreen()
    }
}
