//
//  PresenterConfiguration.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation

protocol PresenterConfiguration {
    associatedtype ViewModel
    associatedtype Router

    var presenter: BasePresenter<ViewModel,Router>? { get }
    var presentable: Presentable? { get }
    var router: Router? { get }
}
