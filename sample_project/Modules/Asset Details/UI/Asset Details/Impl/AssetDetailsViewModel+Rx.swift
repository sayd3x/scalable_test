//
//  AssetDetailsViewModel+Rx.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.01.2021.
//

import RxCocoa
import RxSwift

extension AssetDetailsViewModel {
    var inputTitle: Driver<String?> {
        return Observable.create { sealed -> Disposable in
            let c = self.observeTitle { event in
                sealed.on(event.rxEvent)
            }
            
            return Disposables.create {
                c.cancel()
            }
        }.asDriver(onErrorJustReturn: nil)
    }
    
    var inputSection: Driver<AssetDetailsSection?> {
        return Observable.create { sealed -> Disposable in
            let c = self.observeSection { event in
                sealed.on(event.rxEvent)
            }
            
            return Disposables.create {
                c.cancel()
            }
        }.asDriver(onErrorJustReturn: nil)
    }
}
