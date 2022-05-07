//
//  LoginViewController.swift
//  MVVM-C_Pattern
//
//  Created by Kim dohyun on 2022/05/05.
//

import UIKit


class LoginViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    private func configure() {
        let item = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(loginButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    @objc
    func loginButtonDidTap() {

    }
    
}
