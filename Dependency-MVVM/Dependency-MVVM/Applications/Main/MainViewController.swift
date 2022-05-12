//
//  MainViewController.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/10.
//

import UIKit
import RxSwift
import RxCocoa


class MainViewController: UIViewController {
    
    private var mainViewModel: MainViewModel!
    private let disposeBag: DisposeBag = DisposeBag()
    private var backButton: UIButton = {
        $0.setTitle("BackButton", for: .normal)
        $0.setTitleColor(.green, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: .zero)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorColor = .lightGray
        return tableView
    }()
    
    
    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bind()
    }
    
    private func bind() {
        backButton.rx.tap
            .withUnretained(self)
            .bind { vc, _ in
                vc.mainViewModel.didTapBackButton()
            }.disposed(by: disposeBag)
    }
    
    
    private func configure() {
        view.backgroundColor = .gray
        view.addSubview(backButton)
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
}




extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.mainDependecy.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
