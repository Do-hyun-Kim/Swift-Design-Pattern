//
//  LoginViewController.swift
//  MVVM-C_Pattern
//
//  Created by Kim dohyun on 2022/05/05.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func login()
}

class LoginViewController: UIViewController {
    
    weak var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    
    private func configure() {
        let item = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(loginButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc
    func loginButtonDidTap() {
        self.delegate?.login()
    }
    
}
