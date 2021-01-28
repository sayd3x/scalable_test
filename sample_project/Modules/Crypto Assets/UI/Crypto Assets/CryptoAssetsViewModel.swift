//
//  CryptoAssetsViewModel.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation

protocol CryptoAssetsViewModel {
    func observeItems(_ observer: @escaping (ObservableEvent<[CryptoAssetsItem]>) -> Void) -> Cancelable
    
    func onEvent(_ event: CryptoAssetsEvent)
}
