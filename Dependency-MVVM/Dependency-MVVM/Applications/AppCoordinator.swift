//
//  AppCoordinator.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/09.
//

import UIKit


protocol Coordinator: AnyObject {
    var presneter: UINavigationController? {get set}
    var childrenCoordinators: [Coordinator] {get set}
}

final class AppCoordinator: Coordinator {
    weak var presneter: UINavigationController?
    var childrenCoordinators: [Coordinator]
    var factory: Factory
    
    init(factory: Factory) {
        self.childrenCoordinators = []
        self.factory = factory
    }
    
    func start(_ navigationController: UINavigationController) {
        let vc = factory.makeLoginViewController(coordinator: self)
        self.presneter = navigationController
        self.presneter?.pushViewController(vc, animated: true)
    }
    
    func moveToMainView() {
        let mainVC = factory.makeMainViewController(coordinator: self)
        self.presneter?.pushViewController(mainVC, animated: true)
    }
    
}
