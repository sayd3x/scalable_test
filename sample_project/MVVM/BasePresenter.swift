//
//  BasePresenter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation

class BasePresenter<ViewModel, Router>: Presenter {
    private(set) var viewModel: ViewModel?
    private(set) var router: Router?
    
    func createViewModel() -> ViewModel? {
        return nil
    }
    
    func didAttachWithRouter(_ router: Router?) {
        self.router = router
        self.viewModel = createViewModel()
    }
    
    func didDetach() {
        self.router = nil
        self.viewModel = nil
    }
}
