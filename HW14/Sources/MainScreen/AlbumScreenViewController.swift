//
//  ViewController.swift
//  HW14
//
//  Created by Gabriel Zdravkovici on 11.10.2023.
//

import UIKit

class AlbumScreenViewController: UIViewController {
    
    // MARK: Outlets
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: Setup
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
    
}

