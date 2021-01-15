//
//  UITableView+NibLoadableView.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.12.2020.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: NibLoadableView {
        let nib = UINib(nibName: T.nibName,
                        bundle: Bundle(for: T.self))

        register(nib, forCellReuseIdentifier: T.reusableId)
    }
    
    func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: NibLoadableView {
        let nib = UINib(nibName: T.nibName,
                        bundle: Bundle(for: T.self))

        register(nib, forHeaderFooterViewReuseIdentifier: T.reusableId)
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reusableId) as? T else {
            fatalError("Error during dequeuing the \(T.reusableId) view")
        }

        return view
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reusableId, for: indexPath) as? T else {
            fatalError("Error during dequeuing the \(T.reusableId) cell")
        }

        return cell

    }
}
