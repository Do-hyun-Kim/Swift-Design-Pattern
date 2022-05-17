//
//  ViewControllerDI.swift
//  Swift-Clean_Architecture
//
//  Created by Kim dohyun on 2022/05/16.
//

import Foundation
import UIKit

protocol AppFlowDI {
    func makeAppCoordinator(window: UIWindow) -> AppCoordinator
    func makeMainCoordinator(presenter: UINavigationController) -> MainCoordinator
    func makeDetailCoordinator(presenter: UINavigationController) -> DetailCoordinator
    func makeMainViewController(coordinator: MainCoordinator) -> MainViewController
    func makeMainViewModel(coordinator: MainCoordinator) -> MainViewModel
    func makeMainUseCase() -> DefaultMainUseCase
    func makeDetailViewController() -> DetailViewController
}


final class ViewControllerDI: AppFlowDI {
    
    func makeAppCoordinator(window: UIWindow) -> AppCoordinator {
        let appCoordinator = AppCoordinator(window: window, flowDI: self)
        return appCoordinator
    }
    
    func makeMainCoordinator(presenter: UINavigationController) -> MainCoordinator {
        let mainCoordinator = MainCoordinator(presenter: presenter, flowDI: self)
        return mainCoordinator
    }
    
    func makeMainViewController(coordinator: MainCoordinator) -> MainViewController {
        let mainViewController = MainViewController(viewmodel: makeMainViewModel(coordinator: coordinator))
        return mainViewController
    }
    
    func makeMainViewModel(coordinator: MainCoordinator) -> MainViewModel {
        let mainViewModel = MainViewModel(mainUseCase: makeMainUseCase(), coordinator: coordinator)
        return mainViewModel
    }
    
    func makeMainUseCase() -> DefaultMainUseCase {
        let mainUseCases = DefaultMainUseCase(repository: DefaultMainRepositoy())
        return mainUseCases
    }
    
    func makeDetailCoordinator(presenter: UINavigationController) -> DetailCoordinator {
        let detailCoordinator = DetailCoordinator(presenter: presenter, flowDI:  self)
        return detailCoordinator
    }
    
    func makeDetailViewController() -> DetailViewController {
        let detailViewController = DetailViewController()
        return detailViewController
    }
    
    
}
