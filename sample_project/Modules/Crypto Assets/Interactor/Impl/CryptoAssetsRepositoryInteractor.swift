//
//  CryptoAssetsRepositoryInteractor.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation
import RxSwift

class CryptoAssetsRepositoryInteractor {
    private let repository: CryptoAssetsRepository
    private let nextPage = BehaviorSubject<Int>(value: 1)
    private let fetchInProgress = BehaviorSubject<Bool>(value: false)
    private let assets = BehaviorSubject<[CryptoAssetsAsset]>(value: [])
    
    init(repository: CryptoAssetsRepository) {
        self.repository = repository
    }

    func _cryptoAssetsObserveAssets() -> Observable<[CryptoAssetsAsset]> {
        return assets.asObservable()
    }
    
    func _cryptoAssetsFetchMore() -> Single<Void> {
        return nextPage
            .take(1)
            .withLatestFrom(fetchInProgress) { currentPage, fetchInProgress -> Int in
                guard !fetchInProgress else {
                    throw CryptoAssetsRepositoryInteractorError.fetchInProgress
                }
                return currentPage
            }
            .do(onNext: { [unowned self] _ in
                fetchInProgress.onNext(true)
            }, onDispose: { [unowned self] in
                fetchInProgress.onNext(false)
            })
            .flatMapLatest{ [unowned self] currentPage in
                repository.cryptoAssetsListAssets(page: currentPage, limit: 20)
            }
            .map{ $0.map{ CryptoAssetsAsset($0) } }
            .map{ assets -> [CryptoAssetsAsset] in
                guard !assets.isEmpty else {
                    throw CryptoAssetsRepositoryInteractorError.noMoreElements
                }
                return assets
            }
            .withLatestFrom(assets) { newAssets, assets in
                assets + newAssets
            }
            .withLatestFrom(nextPage) { [unowned self] newAssets, currentPage -> Void in
                assets.onNext(newAssets)
                nextPage.onNext(currentPage + 1)
                return ()
            }
            .asSingle()
    }

}

extension CryptoAssetsRepositoryInteractor: CryptoAssetsInteractor {
    func cryptoAssetsObserveAssets(_ observer: @escaping (ObservableEvent<[CryptoAssetsAsset]>) -> Void) -> Cancelable {
        return _cryptoAssetsObserveAssets()
            .subscribeOn(MainScheduler.instance)
            .subscribeWithObserver(observer)
    }
    
    func cryptoAssetsFetchMore(_ observer: @escaping (Result<Void, Error>) -> Void) -> Cancelable {
        return Completable.create { seal -> Disposable in
            return self._cryptoAssetsFetchMore()
                .subscribe { _ in
                    seal(.completed)
                } onError: { error in
                    seal(.error(error))
                }
        }
        .subscribeOn(MainScheduler.instance)
        .subscribeWithObserver(observer)
    }
}

enum CryptoAssetsRepositoryInteractorError: Error {
    case fetchInProgress
    case noMoreElements
}
