//
//  RxViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation
import RxSwift

class RxViewController: ViewController {
    var disposeBag = DisposeBag()
    
    override func didAttachViewModel() {
        super.didAttachViewModel()
        disposeBag = DisposeBag()
    }
}
