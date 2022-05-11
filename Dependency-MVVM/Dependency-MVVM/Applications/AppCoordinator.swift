//
//  AppCoordinator.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/09.
//

import UIKit


protocol Coordinator: AnyObject {
    var presenter: UINavigationController? {get set}
    var childrenCoordinators: [Coordinator] {get set}
    func start()
}

final class AppCoordinator: Coordinator {
    var presenter: UINavigationController?
    var window: UIWindow?
    var childrenCoordinators: [Coordinator]
    var factory: Factory
    var isLogin: Bool = true
    
    init(window: UIWindow ,factory: Factory) {
        self.window = window
        self.presenter = UINavigationController()
        self.childrenCoordinators = []
        self.factory = factory
    }
    
    func start() {
        if isLogin {
            moveToLoginView()
        } else {
            moveToMainView()
        }
        self.window?.rootViewController = presenter
        self.window?.makeKeyAndVisible()
    }
    
    func moveToLoginView() {
        let loginCoordinator = factory.makeLoginCoordinator(presenter: presenter!, parentCoordinator: self)
        loginCoordinator.start()
        self.childrenCoordinators.append(loginCoordinator)
    }
    
    func moveToMainView() {
        let mainVC = factory.makeMainViewController(coordinator: self)
        self.presenter?.pushViewController(mainVC, animated: true)
    }
    
}
