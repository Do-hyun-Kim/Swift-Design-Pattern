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
    private var mainDependecy: TableViewDependency
    
    var numberOfRowInSection: Int {
        return mainDependecy.numberOfSections()
    }
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    public func didTapBackButton() {
        coordinator?.moveToLoginView()
    }
    
    
    
    
    
}

final class MainDependency: TableViewDependency {
    func numberOfSections() -> Int {
        <#code#>
    }
    
    func showTableView(cellForRowAt: IndexPath) {
        <#code#>
    }
    
}
