//
//  AssetDetailsDescriptionTableViewCell.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import UIKit

class AssetDetailsDescriptionTableViewCell: TableViewCell, NibLoadableView, PresenterCompatible {
    @IBOutlet var descriptionTextView: UITextView!
    
    let presenterConfigurator = PresenterConfigurator<AssetDetailsDescriptionViewModel, NoRouter>()
    
    override func didAttachViewModel() {
        super.didAttachViewModel()
        
        descriptionTextView.text = viewModel?.inputDescription
        
        setNeedsLayout()
    }
}
