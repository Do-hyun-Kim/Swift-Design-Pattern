//
//  MainViewController.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/10.
//

import UIKit


class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        print("MainViewController")
    }
    
    private func configure() {
        view.backgroundColor = .gray
    }
    
}



