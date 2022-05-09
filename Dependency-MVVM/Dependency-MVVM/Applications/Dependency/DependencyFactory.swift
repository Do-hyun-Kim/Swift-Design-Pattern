//
//  DependencyFactory.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/09.
//

import Foundation


protocol Factory {
    func makeLoginViewController(coordinator: AppCoordinator) -> LoginViewController
    func makeCoordinator() -> AppCoordinator
}

class DependencyFactory: Factory {
    func makeLoginViewController(coordinator: AppCoordinator) -> LoginViewController {
        let loginViewController = LoginViewController.init()
        return loginViewController
    }
    
    func makeCoordinator() -> AppCoordinator {
        let coordinator = AppCoordinator(factory: self)
        return coordinator
    }
    
    
}
