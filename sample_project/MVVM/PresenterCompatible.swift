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
