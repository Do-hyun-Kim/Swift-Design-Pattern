//
//  MainViewController.swift
//  Swift-Clean_Architecture
//
//  Created by Kim dohyun on 2022/05/12.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: Property
    private var viewModel: MainViewModel!
    
    private lazy var tableView: UITableView = {
        let mainTableView: UITableView = UITableView(frame: .zero)
        mainTableView.separatorColor = .lightGray
        mainTableView.separatorInset = .zero
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        
        return mainTableView
    }()
    
    
    //MARK: Initialize
    init(viewmodel: MainViewModel) {
        self.viewModel = viewmodel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        print("MainViewController")
        // Do any additional setup after loading the view.
    }

    
    //MARK: Configure
    private func configure() {
        view.backgroundColor = .cyan
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

