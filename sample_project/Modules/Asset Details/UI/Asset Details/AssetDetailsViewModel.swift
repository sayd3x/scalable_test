//
//  AssetDetailsViewModel.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import RxCocoa

struct AssetDetailsSection {
    let header: AssetDetailsHeaderViewModel?
    let items: [AssetDetailsItem]
}

protocol AssetDetailsViewModel {
    func observeTitle(_ observer: @escaping (ObservableEvent<String?>) -> Void) -> Cancelable
    func observeSection(_ observer: @escaping (ObservableEvent<AssetDetailsSection?>) -> Void) -> Cancelable
    
    func onEvent(_ event: AssetDetailsEvent)
}
