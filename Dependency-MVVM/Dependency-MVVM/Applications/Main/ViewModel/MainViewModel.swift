//
//  MainViewModel.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/10.
//

import Foundation
import RxSwift
import RxCocoa



final class MainViewModel {
    
    private var coordinator: AppCoordinator?
    public var mainEntities: [MainEntities] = [MainEntities(person: "Dohyun", age: 20, type: "Swift"),MainEntities(person: "Jun", age: 20, type: "FE"),MainEntities(person: "Gin", age: 21, type: "Android")]
    
    public var numberOfRowsInSection: Int  {
        return mainEntities.count
    }
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    public func didTapBackButton() {
        coordinator?.moveToLoginView()
    }
    
}
