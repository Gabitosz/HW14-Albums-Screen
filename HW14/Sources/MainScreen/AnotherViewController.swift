//
//  AnotherViewController.swift
//  HW14
//
//  Created by Gabriel Zdravkovici on 30.10.2023.
//

import UIKit

class AnotherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.leftBarButtonItem = nil
        self.tabBarController?.navigationItem.title = nil
    }
}
