//
//  LoginViewModel.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/10.
//

import Foundation

final class LoginViewModel {
    var factory: Factory?

    
    
    public func didTapLeftBarButton() {
        let coordinator = factory?.makeMainCoordinator()
        coordinator?.start()
    }
    
    
}
