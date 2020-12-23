//
//  PresenterConfigurator.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation

class PresenterConfigurator<ViewModel,Router>: PresenterConfiguration {
    struct Configuration {
        weak var presentable: (Presentable & AnyObject)?
        var presenter: BasePresenter<ViewModel, Router>?
        var router: Router?
    }
    private var activeConfiguration: Configuration?

    var presenter: BasePresenter<ViewModel, Router>? { activeConfiguration?.presenter }
    var presentable: Presentable? { activeConfiguration?.presentable }
    var router: Router? { activeConfiguration?.router }
    
    func configure(_ configuration: Configuration) throws {
        guard configuration.presentable != nil, configuration.presenter != nil else {
            throw PresenterConfiguratorError.invalidConfiguration
        }

        activeConfiguration?.presenter?.didDetach()
        activeConfiguration = nil

        configuration.presenter?.didAttachWithRouter(configuration.router)
        configuration.presentable?.didAttachViewModel()
        
        activeConfiguration = configuration
    }
}

enum PresenterConfiguratorError: Error {
    case invalidConfiguration
}
