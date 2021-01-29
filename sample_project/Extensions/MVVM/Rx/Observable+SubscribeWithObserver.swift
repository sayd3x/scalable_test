//
//  Observable+SubscribeWithObserver.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.01.2021.
//

import RxSwift

extension Observable {
    func subscribeWithObserver(_ observer: @escaping (ObservableEvent<Element>) -> Void) -> Cancelable {
        return self.subscribe{ event in
            observer(event.observableEvent)
        }.cancelable
    }
}

extension Completable {
    func subscribeWithObserver(_ observer: @escaping (Result<Void,Error>) -> Void) -> Cancelable {
        return self.subscribe{ event in
            switch event {
            case .completed:
                observer(.success(()))
            case .error(let error):
                observer(.failure(error))
            }
        }.cancelable
    }
}
