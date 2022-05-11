//
//  LoginCoordinator.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/11.
//

import UIKit


final class LoginCoordinator: Coordinator {
    
    weak var parentCoordinator: AppCoordinator?
    var presenter: UINavigationController?
    var childrenCoordinators: [Coordinator]
    var factory: Factory
    
    init(presenter: UINavigationController, factory: Factory, parentCoordinator: AppCoordinator) {
        self.presenter = presenter
        self.childrenCoordinators = []
        self.parentCoordinator = parentCoordinator
        self.factory = factory
    }
    
    func start() {
        let loginVC = factory.makeLoginViewController(coordinator: parentCoordinator!)
        self.presenter?.pushViewController(loginVC, animated: true)
    }
}
