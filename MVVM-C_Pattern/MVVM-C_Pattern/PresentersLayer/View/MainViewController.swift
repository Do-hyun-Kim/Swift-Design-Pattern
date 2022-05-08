//
//  MainViewController.swift
//  MVVM-C_Pattern
//
//  Created by Kim dohyun on 2022/05/04.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa


protocol MainViewControllerDelegate: AnyObject {
    func logout()
}

class MainViewController: UIViewController {
    
    //MARK: Property
    
    private(set) var titleLabel: UILabel = {
        $0.text = "MainViewController"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 15)
        return $0
    }(UILabel())
    
    private(set) var nextButton: UIButton = {
        $0.setTitle("nextViewController", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return $0
    }(UIButton())
    
    weak var delegate: MainViewControllerDelegate?
    public var mainViewModel: MainViewModel = MainViewModel()
    private var disposeBag: DisposeBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
        bindUI()
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    
    private func bindUI() {
        nextButton
            .rx.tap
            .bind(to: mainViewModel.output.nextButtonDidTap)
            .disposed(by: disposeBag)
        
        mainViewModel.output
            .nextButtonDidTap
            .withUnretained(self)
            .bind { vc, _ in
                print("Tap")
                vc.delegate?.logout()
            }.disposed(by: disposeBag)
    }
    

    
    private func configure() {
        view.backgroundColor = .white
        
        let item = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(logoutButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        
        [titleLabel,nextButton].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(150)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.centerX.equalTo(titleLabel)
            $0.width.height.equalTo(titleLabel)
        }
        
    }
    
    @objc
    func logoutButtonDidTap() {
        self.delegate?.logout()
    }

}

