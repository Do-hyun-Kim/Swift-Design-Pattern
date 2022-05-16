//
//  MainViewController.swift
//  Swift-Clean_Architecture
//
//  Created by Kim dohyun on 2022/05/12.
//

import UIKit

class MainViewController: UIViewController {

    private var viewModel: MainViewModel!
    
    init(viewmodel: MainViewModel) {
        self.viewModel = viewmodel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        print("MainViewController")
        // Do any additional setup after loading the view.
    }

    
    private func configure() {
        view.backgroundColor = .cyan
    }
    
    

}

