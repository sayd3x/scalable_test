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
        
        //descriptionTextView.text =
        let data = viewModel?.inputDescription?.data(using: .utf8)
        let attributedText = data.map{ try? NSAttributedString(data: $0, options: [.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil) } ?? nil

        if attributedText != nil {
            descriptionTextView.attributedText = attributedText
        } else {
            descriptionTextView.text = viewModel?.inputDescription
        }
                
        setNeedsLayout()
    }
}
