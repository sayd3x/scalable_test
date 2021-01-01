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
    var inputTitle: Driver<String?> { get }
    var inputSection: Driver<AssetDetailsSection> { get }

    var outputEvent: PublishRelay<AssetDetailsEvent> { get }
}
