//
//  AssetDetailsTableViewHeaderFooterView.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import UIKit

class AssetDetailsTableViewHeaderFooterView: TableViewHeaderFooterView, NibLoadableView, PresenterCompatible {
    @IBOutlet var intrinsicView: UIView!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var shortDescriptionLabel: UILabel!
    
    let presenterConfigurator = PresenterConfigurator<AssetDetailsHeaderViewModel, NoRouter>()
    
    override var intrinsicContentSize: CGSize { intrinsicView.bounds.size }
    
    override func didAttachViewModel() {
        super.didAttachViewModel()
        
        subtitleLabel.text = viewModel?.inputTitle
        priceLabel.text = viewModel?.inputPrice
        shortDescriptionLabel.text = viewModel?.inputShortDescription
        
        setNeedsLayout()
        invalidateIntrinsicContentSize()
    }
}
