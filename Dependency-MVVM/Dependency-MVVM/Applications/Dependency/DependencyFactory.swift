//
//  DependencyFactory.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/09.
//

import Foundation
import UIKit


protocol Factory {
    func makeLoginViewController(coordinator: AppCoordinator) -> LoginViewController
    func makeCoordinator(window: UIWindow) -> AppCoordinator
    func makeLoginViewModel(coordinator: AppCoordinator) -> LoginViewModel
    func makeMainViewController(coordinator: AppCoordinator) -> MainViewController
}

class DependencyFactory: Factory {
    
    func makeCoordinator(window: UIWindow) -> AppCoordinator {
        let coordinator = AppCoordinator(window: window, factory: self)
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
