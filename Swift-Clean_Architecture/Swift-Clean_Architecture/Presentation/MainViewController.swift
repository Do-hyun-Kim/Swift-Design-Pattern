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
        mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
        mainTableView.backgroundColor = .white
        mainTableView.rowHeight = 100
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
        // Do any additional setup after loading the view.
    }

    
    //MARK: Configure
    private func configure() {
        view.backgroundColor = .cyan
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.mainUseCase.execute(entities: viewModel.entities)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        cell.bind(viewmodel: viewModel, indexPath: indexPath)
        return cell
    }

    
}

