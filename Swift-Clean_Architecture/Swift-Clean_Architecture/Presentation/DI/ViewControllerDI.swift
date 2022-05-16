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
    func makeMainViewController() -> MainViewController
    func makeMainViewModel() -> MainViewModel
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
    
    func makeMainViewController() -> MainViewController {
        let mainViewController = MainViewController(viewmodel: makeMainViewModel())
        return mainViewController
    }
    
    func makeMainViewModel() -> MainViewModel {
        let mainViewModel = MainViewModel()
        return mainViewModel
    }
    
    
}
