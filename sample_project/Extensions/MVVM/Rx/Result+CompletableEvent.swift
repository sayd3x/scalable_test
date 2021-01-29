//
//  Result+CompletableEvent.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.01.2021.
//

import RxSwift

extension Result where Success == Void, Failure: Error {
    var rxEvent: CompletableEvent {
        switch self {
        case .success:
            return .completed
        case .failure(let error):
            return .error(error)
        }
    }
}
