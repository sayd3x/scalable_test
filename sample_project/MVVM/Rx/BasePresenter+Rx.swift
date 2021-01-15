//
//  BasePresenter+Rx.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation
import RxSwift

class BasePresenterRx<ViewModel, Router>: BasePresenter<ViewModel, Router> {
    var disposeBag = DisposeBag()

    override func didAttachWithRouter(_ router: Router?) {
        disposeBag = DisposeBag()
        super.didAttachWithRouter(router)
    }
    
    override func didDetach() {
        super.didDetach()
        disposeBag = DisposeBag()
    }
}

extension BasePresenter {
    typealias Rx = BasePresenterRx<ViewModel, Router>
}
