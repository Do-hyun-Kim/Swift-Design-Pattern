//
//  AppCoordinator.swift
//  MVVM-C_Pattern
//
//  Created by Kim dohyun on 2022/05/04.
//

import UIKit

protocol Coordinator: AnyObject {
    var presenter: UINavigationController {get set}
    var childrenCoordinator: [Coordinator] {get set}
    func start()
}


class AppCoordinator: Coordinator {
    var window: UIWindow
    var presenter: UINavigationController
    var childrenCoordinator: [Coordinator]
    
    init(window: UIWindow) {
        self.window = window
        self.presenter = UINavigationController()
        self.childrenCoordinator = []
    }
    
    func start() {
        window.rootViewController = presenter
        window.makeKeyAndVisible()
    }
}
