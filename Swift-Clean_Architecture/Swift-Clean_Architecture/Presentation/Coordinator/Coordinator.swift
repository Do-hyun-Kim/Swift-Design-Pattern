//
//  Coordinator.swift
//  Swift-Clean_Architecture
//
//  Created by Kim dohyun on 2022/05/16.
//

import UIKit

protocol Coordinator: AnyObject {
    var presenter: UINavigationController {get set}
    var childrenCoordinator: [Coordinator] {get set}
    func start()
}


final class AppCoordinator: Coordinator {
    var presenter: UINavigationController
    var childrenCoordinator: [Coordinator]
    var window: UIWindow
    var flowDI: AppFlowDI
    
    init(window: UIWindow , flowDI: AppFlowDI) {
        self.window = window
        self.presenter = UINavigationController()
        self.flowDI = flowDI
        self.childrenCoordinator = []
    }
    
    func start() {
        moveToMain()
        self.window.rootViewController = presenter
        self.window.makeKeyAndVisible()
    }
    
    func moveToMain() {
        let mainCoordinator = flowDI.makeMainCoordinator(presenter: presenter)
        mainCoordinator.start()
        self.childrenCoordinator.append(mainCoordinator)
    }
}


final class MainCoordinator: Coordinator {
    var presenter: UINavigationController
    var childrenCoordinator: [Coordinator]
    var flowDI: AppFlowDI
    
    init(presenter: UINavigationController, flowDI: AppFlowDI) {
        self.presenter = presenter
        self.flowDI = flowDI
        self.childrenCoordinator = []
    }
    
    func start() {
        let mainVC = flowDI.makeMainViewController(coordinator: self)
        self.presenter.pushViewController(mainVC, animated: true)
    }
    
    func moveToDetail() {
        let detailCoordinator = flowDI.makeDetailCoordinator(presenter: presenter)
        detailCoordinator.start()
        self.childrenCoordinator.append(detailCoordinator)
    }
    
}


final class DetailCoordinator: Coordinator {
    var presenter: UINavigationController
    var childrenCoordinator: [Coordinator]
    var flowDI: AppFlowDI
    
    init(presenter: UINavigationController, flowDI: AppFlowDI) {
        self.presenter = presenter
        self.flowDI = flowDI
        self.childrenCoordinator = []
    }
    
    func start() {
        let detailVC = flowDI.makeDetailViewController()
        self.presenter.pushViewController(detailVC, animated: true)
    }
    
    
}
