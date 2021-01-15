//
//  ViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import UIKit

class ViewController: UIViewController, Presentable {
    private var viewModelWasBinded = false
    private weak var progressActivityView: UIView?
    
    func showProgressActivityView(_ show: Bool = true) {
        if !show {
            progressActivityView?.removeFromSuperview()
            return
        }

        guard progressActivityView == nil else {
            return
        }
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = nil
        // add to the main view
        self.view.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.superview!.topAnchor),
            view.rightAnchor.constraint(equalTo: view.superview!.rightAnchor),
            view.leftAnchor.constraint(equalTo: view.superview!.leftAnchor),
            view.bottomAnchor.constraint(equalTo: view.superview!.bottomAnchor)
        ])
        progressActivityView = view

        // add background
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.5
        
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: backgroundView.superview!.topAnchor),
            backgroundView.rightAnchor.constraint(equalTo: backgroundView.superview!.rightAnchor),
            backgroundView.leftAnchor.constraint(equalTo: backgroundView.superview!.leftAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: backgroundView.superview!.bottomAnchor)
        ])

        // setup indicator
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        view.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: indicator.superview!.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: indicator.superview!.centerXAnchor)
        ])
        
    }
    
    func didAttachViewModel() {
        viewModelWasBinded = false
        if isViewLoaded {
            bindViewModel()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !viewModelWasBinded {
            bindViewModel()
        }
    }
    
    func bindViewModel() {
        viewModelWasBinded = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    
        guard let binder = sender as? SegueSender else { return }
        binder(segue.destination)
    }
}

