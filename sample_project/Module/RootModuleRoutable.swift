//
//  RootModuleRoutable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation

protocol RootModuleRoutable {
    var rootModule: (UIModule & RootModule)? { get }
}
