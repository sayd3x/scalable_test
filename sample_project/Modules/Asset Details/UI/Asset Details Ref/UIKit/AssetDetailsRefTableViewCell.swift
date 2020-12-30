//
//  AssetDetailsRefTableViewCell.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import UIKit

class AssetDetailsRefTableViewCell: TableViewCell, NibLoadableView, PresenterCompatible {
    @IBOutlet var titleLabel: UILabel!
    
    let presenterConfigurator = PresenterConfigurator<AssetDetailsRefViewModel, NoRouter>()
    
    override func didAttachViewModel() {
        super.didAttachViewModel()
        
        titleLabel.text = viewModel?.inputTitle
    }
}
