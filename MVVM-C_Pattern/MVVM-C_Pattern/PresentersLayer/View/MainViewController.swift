//
//  MainViewController.swift
//  MVVM-C_Pattern
//
//  Created by Kim dohyun on 2022/05/04.
//

import UIKit

class MainViewController: UIViewController {
    
    private(set) var titleLabel: UILabel = {
        $0.text = "MainViewController"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 15)
        return $0
    }(UILabel())
    
    private(set) var nextButton: UIButton = {
        $0.setTitle("nextViewController", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
    }
    private func configure() {
        print("ViewController")
        view.backgroundColor = .white
        
        [titleLabel,nextButton].forEach {
            view.addSubview($0)
        }
        
    }

}

