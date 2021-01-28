//
//  CryptoAssetsViewModel+Rx.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.01.2021.
//

import RxCocoa
import RxSwift

extension CryptoAssetsViewModel {
    var inputItems: Driver<[CryptoAssetsItem]> {
        return Observable.create { seal -> Disposable in
            let c = self.observeItems { event in
                seal.on(event.rxEvent)
            }
            
            return Disposables.create {
                c.cancel()
            }
        }.asDriver(onErrorJustReturn: [])
    }
}
