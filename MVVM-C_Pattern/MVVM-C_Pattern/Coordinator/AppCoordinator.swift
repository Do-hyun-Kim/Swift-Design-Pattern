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

protocol LoginCoordinatorDelegate: AnyObject {
    func didLoginIn(_ coordinator: LoginCoordinator)
}


protocol MainCoordinatorDelegate: AnyObject {
    func didLogedout(_ coordinator: MainCoordinator)
}

class AppCoordinator: Coordinator, LoginCoordinatorDelegate, MainCoordinatorDelegate {
    var presenter: UINavigationController
    var childrenCoordinator: [Coordinator]
    
    var isLoggedIn: Bool = false
    
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
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
        coordinator.delegate = self
        coordinator.start()
        childrenCoordinator.append(coordinator)
    }
    
    private func showLoginViewController() {
        let coordinator = LoginCoordinator(presenter: presenter)
        coordinator.delegate = self
        coordinator.start()
        childrenCoordinator.append(coordinator)
    }
    
    func didLoginIn(_ coordinator: LoginCoordinator) {
        childrenCoordinator = childrenCoordinator.filter { $0 !== coordinator }
        showMainViewController()
    }
    
    func didLogedout(_ coordinator: MainCoordinator) {
        childrenCoordinator = childrenCoordinator.filter { $0 !== coordinator }
        showLoginViewController()
    }
}



class LoginCoordinator: Coordinator, LoginViewControllerDelegate {
    var presenter: UINavigationController
    var childrenCoordinator: [Coordinator]
    var delegate: LoginCoordinatorDelegate?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childrenCoordinator = []
    }
    
    func start() {
        let viewController = LoginViewController.init()
        viewController.view.backgroundColor = .white
        viewController.delegate = self
        self.presenter.viewControllers = [viewController]
        print("rootView",self.presenter.topViewController)
    }
    
    func login() {
        delegate?.didLoginIn(self)
    }
    
}




class MainCoordinator: Coordinator, MainViewControllerDelegate {
    var presenter: UINavigationController
    var childrenCoordinator: [Coordinator]
    weak var delegate: MainCoordinatorDelegate?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childrenCoordinator = []
    }
    
    func start() {
        let viewController = MainViewController.init()
        viewController.view.backgroundColor = .gray
        viewController.delegate = self
        presenter.viewControllers = [viewController]
        print("rootView",self.presenter.topViewController)
    }
    
    func logout() {
        delegate?.didLogedout(self)
    }
}
