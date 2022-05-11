//
//  LoginViewModel.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/10.
//

import Foundation

final class LoginViewModel {
    
    let coordinator: AppCoordinator?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        print("dependency", coordinator)
    }

    public func didTapLeftBarButton() {
        coordinator?.moveToLoginView()
    }
    
    
}
