//
//  NibLoadableView+UIView.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import UIKit

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
