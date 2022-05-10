//
//  SettingCoordinator.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/10.
//

import UIKit

final class SettingCoordinator: Coordinator {
    var presenter: UINavigationController?
    var childrenCoordinators: [Coordinator]
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childrenCoordinators = []
    }
    
    func start() {
        
    }
    
}
