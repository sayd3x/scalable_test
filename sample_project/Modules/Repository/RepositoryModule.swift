//
//  RepositoryModule.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation

protocol RepositoryModule {
    func didRegisterWithModulesRepository(_ modulesRepository: ModulesRepository) throws
}
