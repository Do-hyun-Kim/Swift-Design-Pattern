//
//  AppCoordinator.swift
//  Coordinator-Pattern
//
//  Created by Kim dohyun on 2022/05/03.
//

import UIKit


protocol Coordinator: AnyObject {
    var presenter: UINavigationController { get set }
    var childCoordinator: [Coordinator] { get set }
    func start()
}

class AppCoordinator: Coordinator {
    var window: UIWindow
    var presenter: UINavigationController
    var childCoordinator: [Coordinator]
    
    init(window: UIWindow) {
        self.window = window
        self.presenter = UINavigationController()
        self.childCoordinator = []
    }
    
    func start() {
        window.rootViewController = presenter
        window.makeKeyAndVisible()
    }
}



class HomeCoordinator: Coordinator {
    
    var presenter: UINavigationController
    var childCoordinator: [Coordinator]
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childCoordinator = []
    }
    
    func start() {
        let homeVC = ViewController.init()
        presenter.pushViewController(homeVC, animated: true)
    }
}
