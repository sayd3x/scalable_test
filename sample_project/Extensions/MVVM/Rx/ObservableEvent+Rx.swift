//
//  ObservableEvent+Rx.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.01.2021.
//

import Foundation
import RxSwift

extension ObservableEvent {
    var rxEvent: Event<T> {
        switch self {
        case .done:
            return .completed
        case .error(let error):
            return .error(error)
        case .next(let value):
            return .next(value)
        }
    }
}

extension Event {
    var observableEvent: ObservableEvent<Element> {
        switch self {
        case .completed:
            return .done
        case .error(let error):
            return .error(error)
        case .next(let value):
            return .next(value)
        }
    }
}
