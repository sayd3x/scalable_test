//
//  UITableView+TableViewCellStore.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import UIKit

extension UITableView {

    func heightOf<T>(_ cellType: T.Type,
                         forModel model: T.ViewModel
    ) -> CGFloat where T: UITableViewCell & Presentable & PresenterCompatible, T.Router == NoRouter {
        let cell = dequeueReusableCell(withIdentifier: T.reusableId) as! T
        cell.attachViewModel(model)
        cell.layoutIfNeeded()

        var size = UIView.layoutFittingCompressedSize
        size.width = self.frame.width
        return cell.systemLayoutSizeFitting(size).height
    }

    func heightOf<T>(_ cellType: T.Type,
                         forModel model: T.ViewModel
    ) -> CGFloat where T: UITableViewHeaderFooterView & Presentable & PresenterCompatible, T.Router == NoRouter {
        let cell = dequeueReusableHeaderFooterView(withIdentifier: T.reusableId) as! T
        cell.attachViewModel(model)
        cell.layoutIfNeeded()

        var size = UIView.layoutFittingCompressedSize
        size.width = self.frame.width
        return cell.systemLayoutSizeFitting(size).height
    }
}
