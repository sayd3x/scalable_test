//
//  Router+SegueSender.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import UIKit

extension Router {
    func segueSenderFor<VC: Presentable & PresenterCompatible & UIViewController>(
        _ type: VC.Type,
        withPresenter presenter: BasePresenter<VC.ViewModel, VC.Router>,
        andRouter router: UIKitRouter<VC>
    ) -> SegueSender {
        return { destVC in
            guard let vc = destVC as? VC else { return }
    
            // setup router
            router.setViewController(vc)
            let routes = router as? VC.Router
    
            // assign router and modelViewController
            try! vc.presenterConfigurator.configure(.init(presentable: vc, presenter: presenter, router: routes))
        }
    }
}
