//
//  CryptoAssetsViewModel.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation
import RxCocoa

protocol CryptoAssetsViewModel {
    var inputItems: Driver<[CryptoAssetsItem]> { get }
    
    var outputEvent: PublishRelay<CryptoAssetsEvent> { get }
}

