//
//  ModulesRepository.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation

protocol ModulesRepository {
    func getModule<T>(_ type:T.Type) -> T?
}

extension ModulesRepository {
    func getModule<T>() -> T? {
        return self.getModule(T.self)
    }
}
