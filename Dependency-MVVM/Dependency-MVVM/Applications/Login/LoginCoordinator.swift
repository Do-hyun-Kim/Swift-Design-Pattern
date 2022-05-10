//
//  LoginCoordinator.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/09.
//

import UIKit

final class LoginCoordinator: Coordinator {
    var presneter: UINavigationController?
    var childrenCoordinators: [Coordinator]
    var factory: Factory
    
    init(factory: Factory) {
        self.childrenCoordinators = []
        self.factory = factory
        self.presneter = UINavigationController()
    }
    
    func start() {
        let mainVC = factory.makeMainViewController(coordinator: self)
        self.presneter?.pushViewController(mainVC, animated: false)
    }
    
    
}
