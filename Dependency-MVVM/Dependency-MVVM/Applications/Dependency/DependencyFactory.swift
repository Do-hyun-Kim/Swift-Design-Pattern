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
    func makeLoginViewModel(coordinator: AppCoordinator) -> LoginViewModel
    func makeMainViewController(coordinator: AppCoordinator) -> MainViewController
}

class DependencyFactory: Factory {
    
    func makeCoordinator() -> AppCoordinator {
        let coordinator = AppCoordinator(factory: self)
        return coordinator
    }
    
    func makeLoginViewController(coordinator: AppCoordinator) -> LoginViewController {
        let loginViewController = LoginViewController(loginViewModel: makeLoginViewModel(coordinator: coordinator))
        return loginViewController
    }
    
    func makeLoginViewModel(coordinator: AppCoordinator) -> LoginViewModel {
        let loginViewModel = LoginViewModel(coordinator: coordinator)
        return loginViewModel
    }
    
    func makeMainViewController(coordinator: AppCoordinator) -> MainViewController {
        let mainViewController = MainViewController.init()
        return mainViewController
    }
    
    
}
