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
    func makeMainViewController(coordinator: AppCoordinator) -> MainViewController
    func makeLoginViewModel(coordinator: AppCoordinator) -> LoginViewModel
    func makeMainViewModel(coordinator: AppCoordinator) -> MainViewModel
    func makeCoordinator(window: UIWindow) -> AppCoordinator
    func makeLoginCoordinator(presenter: UINavigationController, parentCoordinator: AppCoordinator) -> LoginCoordinator
    func makeMainCoordinator(presenter: UINavigationController, parentCoordinator: AppCoordinator) -> MainCoordinator
}

class DependencyFactory: Factory {
   
    func makeCoordinator(window: UIWindow) -> AppCoordinator {
        let coordinator = AppCoordinator(window: window, factory: self)
        return coordinator
    }
    
    func makeLoginCoordinator(presenter: UINavigationController, parentCoordinator: AppCoordinator) -> LoginCoordinator {
        let coordinator = LoginCoordinator(presenter: presenter, factory: self, parentCoordinator: parentCoordinator)
        return coordinator
    }
    
    func makeMainCoordinator(presenter: UINavigationController, parentCoordinator: AppCoordinator) -> MainCoordinator {
        let coordinator = MainCoordinator(presenter: presenter, factory: self, parentCoordinator: parentCoordinator)
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
        let mainViewController = MainViewController.init(mainViewModel: makeMainViewModel(coordinator: coordinator))
        return mainViewController
    }
    
    func makeMainViewModel(coordinator: AppCoordinator) -> MainViewModel {
        let mainViewModel = MainViewModel(coordinator: coordinator)
        return mainViewModel
    }
    
}
