//
//  MainUseCases.swift
//  Swift-Clean_Architecture
//
//  Created by Kim dohyun on 2022/05/16.
//

import Foundation

protocol MainUseCase {
    func execute(entities: [MainEntities]) -> Int
}


final class DefaultMainUseCase: MainUseCase {
    
    
    private let repository: ConfigureRepository
    
    init(repository: ConfigureRepository) {
        self.repository = repository
    }
    
    func execute(entities: [MainEntities]) -> Int {
        if entities.isEmpty {
            return 0
        }
        return repository.numberOfRowsInSection(entities: entities)
    }
}


final class DefaultMainRepositoy: ConfigureRepository {
    
    func numberOfRowsInSection(entities: [MainEntities]) -> Int {
        return entities.count
    }
}


protocol ConfigureRepository {
    func numberOfRowsInSection(entities: [MainEntities]) -> Int
}

