//
//  CryptoAssetsAssetTableViewCell.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation
import UIKit

class CryptoAssetsAssetTableViewCell: TableViewCell, NibLoadableView, PresenterCompatible {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!

    let presenterConfigurator = PresenterConfigurator<CryptoAssetsAssetViewModel, NoRouter>()
    
    override func didAttachViewModel() {
        super.didAttachViewModel()
        
        titleLabel.text = viewModel?.inputSymbolName
        subtitleLabel.text = viewModel?.inputName
        priceLabel.text = viewModel?.inputPrice
        
        setNeedsLayout()
    }

}
