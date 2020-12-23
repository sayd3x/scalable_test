//
//  Presenter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation

protocol Presenter {
    associatedtype ViewModel
    associatedtype Router

    var viewModel: ViewModel? { get }
    var router: Router? { get }

    func didAttachWithRouter(_ router: Router?)
    func didDetach()
}
