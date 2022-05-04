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
    
    init(window: UIWindow) {
        self.window = window
        self.presenter = UINavigationController()
        self.childrenCoordinator = []
    }
    
    func start() {
        let coordinator = MainCoordinator(presenter: presenter)
        childrenCoordinator.append(coordinator)
        coordinator.start()
        
        window.makeKeyAndVisible()
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
        mainVC.coordinator = self
        presenter.pushViewController(mainVC, animated: true)
    }
    
    func showSecondViewController() {
        let secondCoordinator = SecondCoordinator(presenter: presenter)
        childrenCoordinator.append(secondCoordinator)
        secondCoordinator.start()
    }
}


class SecondCoordinator: Coordinator {
    var presenter: UINavigationController
    var childrenCoordinator: [Coordinator]
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childrenCoordinator = []
    }
    
    func start() {
        let secondVC = SecondViewController.init()
        presenter.pushViewController(secondVC, animated: true)
    }
}
