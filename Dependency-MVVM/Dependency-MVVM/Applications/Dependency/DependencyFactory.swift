//
//  DependencyFactory.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/09.
//

import Foundation


protocol Factory {
    func makeLoginViewController(coordinator: Coordinator) -> LoginViewController
    func makeCoordinator() -> AppCoordinator
    func makeLoginViewModel() -> LoginViewModel
    func makeMainViewController(coordinator: Coordinator) -> MainViewController
    func makeMainCoordinator() -> LoginCoordinator
}

class DependencyFactory: Factory {
    func makeLoginViewController(coordinator: Coordinator) -> LoginViewController {
        let loginViewController = LoginViewController(loginViewModel: makeLoginViewModel())
        return loginViewController
    }
    
    func makeLoginViewModel() -> LoginViewModel {
        let loginViewModel = LoginViewModel()
        return loginViewModel
    }
    
    func makeCoordinator() -> AppCoordinator {
        let coordinator = AppCoordinator(factory: self)
        return coordinator
    }
    
    func makeMainViewController(coordinator: Coordinator) -> MainViewController {
        let mainViewController = MainViewController.init()
        return mainViewController
    }
    
    func makeMainCoordinator() -> LoginCoordinator {
        let mainCoordinator = LoginCoordinator(factory: self)
        return mainCoordinator
    }
    
    
    
    
    
    
}
