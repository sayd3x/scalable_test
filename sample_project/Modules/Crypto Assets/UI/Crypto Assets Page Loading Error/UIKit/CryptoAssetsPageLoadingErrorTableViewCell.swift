//
//  CryptoAssetsPageLoadingErrorTableViewCell.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import UIKit

class CryptoAssetsPageLoadingErrorTableViewCell: TableViewCell, NibLoadableView, PresenterCompatible {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!

    let presenterConfigurator = PresenterConfigurator<CryptoAssetsPageLoadingErrorViewModel, NoRouter>()
    
    override func didAttachViewModel() {
        super.didAttachViewModel()
        
        titleLabel.text = viewModel?.inputTitle
        subtitleLabel.text = viewModel?.inputSubtitle
        
        setNeedsLayout()
    }
}
