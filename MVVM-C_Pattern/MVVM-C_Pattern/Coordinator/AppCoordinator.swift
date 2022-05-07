//
//  AppCoordinator.swift
//  MVVM-C_Pattern
//
//  Created by Kim dohyun on 2022/05/04.
//

import UIKit

protocol Coordinator: AnyObject {
    var presenter: UINavigationController {get set}
    var childrenCoordinator: [Coordinator] {get set}
    func start()
}


class AppCoordinator: Coordinator {
    var window: UIWindow
    var presenter: UINavigationController
    var childrenCoordinator: [Coordinator]
    
    var isLoggedIn: Bool = false
    
    
    init(window: UIWindow) {
        self.window = window
        self.presenter = UINavigationController()
        self.childrenCoordinator = []
    }
    
    func start() {
        if self.isLoggedIn {
            self.showMainViewController()
        } else {
            self.showLoginViewController()
        }
    }
    
    
    private func showMainViewController() {
        let coordinator = MainCoordinator(presenter: presenter)
        coordinator.parentCoordinator = self
        childrenCoordinator.append(coordinator)
        coordinator.start()
        window.makeKeyAndVisible()
    }
    
    private func showLoginViewController() {
        
    }
}



class LoginCoordinator: Coordinator {
    var presenter: UINavigationController
    var childrenCoordinator: [Coordinator]
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childrenCoordinator = []
    }
    
    func start() {
        let viewController = LoginViewController.init()
        viewController.view.backgroundColor = .white
        self.presenter.viewControllers = [viewController]
    }
    
}




class MainCoordinator: Coordinator {
    var presenter: UINavigationController
    var childrenCoordinator: [Coordinator]
    weak var parentCoordinator: AppCoordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childrenCoordinator = []
    }
    
    func start() {
        let mainVC = MainViewController.init()
        mainVC.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showSecondViewController))
        mainVC.coordinator = self
        presenter.pushViewController(mainVC, animated: true)
    }
    
    @objc
    func showSecondViewController() {
        let editCoordinator = EditCoordinator(presenter: presenter)
        childrenCoordinator.append(editCoordinator)
        editCoordinator.start()
    }
}


class EditCoordinator: Coordinator {
    var presenter: UINavigationController
    var childrenCoordinator: [Coordinator]
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childrenCoordinator = []
    }
    
    func start() {
        let secondVC = EditViewController.init()
        presenter.pushViewController(secondVC, animated: true)
    }
}
