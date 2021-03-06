//
//  MessariError.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation

enum MessariError {
    case serverResponse(MessariStatus)
    case unknownError
}

extension MessariError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .serverResponse(let response):
            return response.errorMessage
        case .unknownError:
            return "Messari error"
        }
    }
}
