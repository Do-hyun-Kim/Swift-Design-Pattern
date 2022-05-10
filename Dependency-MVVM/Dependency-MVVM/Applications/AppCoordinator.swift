//
//  AppCoordinator.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/09.
//

import UIKit


protocol Coordinator: AnyObject {
    var presenter: UINavigationController? {get set}
    var childrenCoordinators: [Coordinator] {get set}
    func start()
}

final class AppCoordinator: Coordinator {
    var presenter: UINavigationController?
    var window: UIWindow?
    var childrenCoordinators: [Coordinator]
    var factory: Factory
    
    init(window: UIWindow ,factory: Factory) {
        self.window = window
        self.presenter = UINavigationController()
        self.childrenCoordinators = []
        self.factory = factory
    }
    
    func start() {
        let vc = factory.makeLoginViewController(coordinator: self)
        self.presenter?.pushViewController(vc, animated: true)
        self.window?.rootViewController = presenter
        self.window?.makeKeyAndVisible()
    }
    
    func moveToMainView() {
        let mainVC = factory.makeMainViewController(coordinator: self)
        self.presenter?.pushViewController(mainVC, animated: true)
    }
    
}
