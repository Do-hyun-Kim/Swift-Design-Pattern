//
//  MainViewModel.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/10.
//

import Foundation
import RxSwift
import RxCocoa


protocol TableViewDependency {
    func numberOfSections() -> Int
    func showTableView(cellForRowAt: IndexPath)
}

final class MainViewModel {
    
    private var coordinator: AppCoordinator?
    public var mainDependecy: TableViewDependency
    
    
    init(coordinator: AppCoordinator, mainDependency: TableViewDependency) {
        self.coordinator = coordinator
        self.mainDependecy = mainDependency
        
    }
    
    public func didTapBackButton() {
        coordinator?.moveToLoginView()
    }
    
}



final class MainDependency: TableViewDependency {
    func numberOfSections() -> Int {
        return 3
    }
    
    func showTableView(cellForRowAt: IndexPath) {
        return
    }
    
}
