//
//  ReusableView+UIView.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import UIKit

extension ReusableView where Self: UIView {
    static var reusableId: String {
        return NSStringFromClass(self)
    }
}
