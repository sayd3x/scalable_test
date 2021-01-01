//
//  AssetDetailsMockedInteractor.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 31.12.2020.
//

import Foundation
import RxSwift

struct AssetDetailsMockedInteractor {
    
}

extension AssetDetailsMockedInteractor: AssetDetailsInteractor {
    func observeAssetDetails() -> Observable<AssetDetailsAsset?> {
        let details = AssetDetailsAsset(
            name: "Bitcoin",
            symbol: "BTC",
            usdPrice: Decimal(string: "27000"),
            tagline: "Tag line here",
            projectDetails: """
            Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
            """,
            projectLinks: [
                .init(name: "Website", url: "https://bitcoin.org"),
                .init(name: "Exprolers", url: "https://blockchain.info"),
            ])
        
        return Observable.never().startWith(details)
    }
    
    func assetDetailsObserveTimeSeries() -> Observable<AssetDetailsTimeSeries?> {
        .just(nil)
    }
}
