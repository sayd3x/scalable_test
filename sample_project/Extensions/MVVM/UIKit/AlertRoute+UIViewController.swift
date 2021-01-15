//
//  AlertRoute+UIViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import UIKit

extension AlertRoute where Self: Router, Self.ViewController: UIViewController {
    func showAlert(_ title: String, withMessage message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        
        viewController?.present(alertController, animated: true, completion: nil)
    }

}
