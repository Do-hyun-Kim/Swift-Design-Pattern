//
//  LoginViewController.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/09.
//

import UIKit

class LoginViewController: UIViewController {

    public var loginViewModel: LoginViewModel!
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }

    private func configure() {
        view.backgroundColor = .cyan
    }

}

