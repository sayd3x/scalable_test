//
//  PresenterCompatible.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation

protocol PresenterCompatible {
    associatedtype ViewModel
    associatedtype Router

    var presenterConfigurator: PresenterConfigurator<ViewModel, Router> { get }
}

extension PresenterCompatible {
    var viewModel: ViewModel? { self.presenterConfigurator.presenter?.viewModel }
}

extension PresenterCompatible where Self: Presentable & AnyObject {
    func attachPresenter(_ presenter: BasePresenter<ViewModel, Router>, withRouter router: Router?) throws {
        try presenterConfigurator.configure(.init(presentable: self, presenter: presenter, router: router))
    }
}

extension PresenterCompatible where Self: Presentable & AnyObject, Router == NoRouter {
    func attachViewModel(_ model: ViewModel?) {
        let presenter = NoRouterPresenter<ViewModel> {
            return model
        }
        try! attachPresenter(presenter, withRouter: nil)
    }
}

