//
//  MainViewModel.swift
//  Swift-Clean_Architecture
//
//  Created by Kim dohyun on 2022/05/16.
//

import Foundation

final class MainViewModel {
    
    public let coordinator: MainCoordinator
    public let mainUseCase: MainUseCase
    public let entities: [MainEntities] = [MainEntities(title: "MVP Pattern", pattern: "MVP", subTitle: "Presenter를 이용하며 View의 Life Cycle 영향을 받지 않는다"), MainEntities(title: "MVVM Pattern", pattern: "MVVM", subTitle: "ViewModel을 이용하여 View에 비즈니스 로직을 ViewModel이 감당하여 Massive한 부분을 조금더 줄여 줄수 있다.")]
    
    init(mainUseCase: MainUseCase, coordinator: MainCoordinator) {
        self.mainUseCase = mainUseCase
        self.coordinator = coordinator
    }
    

    
    
    
    
    
    
}
