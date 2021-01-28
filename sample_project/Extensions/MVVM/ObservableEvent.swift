//
//  ObservableEvent.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.01.2021.
//

import Foundation

enum ObservableEvent<T> {
    case next(T)
    case error(Error)
    case done
}
