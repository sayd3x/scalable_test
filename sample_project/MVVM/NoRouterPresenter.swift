//
//  NoRouterPresenter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation

class NoRouterPresenter<ViewModel>: BasePresenter<ViewModel, NoRouter> {
    private let viewModelFactory: () -> ViewModel?
    
    override func createViewModel() -> ViewModel? {
        return viewModelFactory()
    }
    
    init(viewModelFactory: @escaping () -> ViewModel?) {
        self.viewModelFactory = viewModelFactory
    }
}
