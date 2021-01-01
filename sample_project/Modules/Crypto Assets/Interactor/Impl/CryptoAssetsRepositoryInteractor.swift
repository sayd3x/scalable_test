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
    func cryptoAssetsObserveAssets() -> Observable<[CryptoAssetsAsset]> {
        return Observable.deferred{
            self._cryptoAssetsObserveAssets()
        }.subscribeOn(MainScheduler.instance)
    }
    
    func cryptoAssetsFetchMore() -> Single<Void> {
        return Single.deferred{
            self._cryptoAssetsFetchMore()
        }.subscribeOn(MainScheduler.instance)
    }
}

enum CryptoAssetsRepositoryInteractorError: Error {
    case fetchInProgress
    case noMoreElements
}
