//
//  Disposable+Cancelable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.01.2021.
//

import RxSwift

extension Disposable {
    var cancelable: Cancelable {
        return SimplyCancelable(wrapped: self)
    }
}

fileprivate struct SimplyCancelable: Cancelable {
    let wrapped: Disposable
    
    func cancel() {
        wrapped.dispose()
    }
}
