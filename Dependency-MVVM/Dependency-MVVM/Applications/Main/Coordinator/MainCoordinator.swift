//
//  MainCoordinator.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/11.
//

import Foundation
import UIKit


final class MainCoordinator: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    var presenter: UINavigationController?
    var childrenCoordinators: [Coordinator]
    var factory: Factory
    
    init(presenter: UINavigationController, factory: Factory, parentCoordinator: AppCoordinator) {
        self.presenter = presenter
        self.factory = factory
        self.parentCoordinator = parentCoordinator
        self.childrenCoordinators = []
    }
    
    
    func start() {
        let mainVC = factory.makeMainViewController(coordinator: parentCoordinator!)
        self.presenter?.pushViewController(mainVC, animated: true)
    }

}
