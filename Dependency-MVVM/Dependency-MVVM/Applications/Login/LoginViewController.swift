//
//  LoginViewController.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/09.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    //MARK: Property
    
    private var centerButton: UIButton = {
        $0.setTitle("MainView", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    private let disposeBag: DisposeBag = DisposeBag()
    public var loginViewModel: LoginViewModel!
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bind()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: Configure
    
    private func bind() {
        centerButton.rx.tap
            .withUnretained(self)
            .bind { vc, _ in
                vc.loginViewModel.didTapLeftBarButton()
            }.disposed(by: disposeBag)
    }

    
    
    private func configure() {
        view.backgroundColor = .cyan
        view.addSubview(centerButton)
        centerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        centerButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }

}

