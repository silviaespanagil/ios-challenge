//
//  GetPropertyListUseCase.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Combine

class GetAllPropertiesUseCase {
    
    private let repository: PropertyRepository
    
    init(repository: PropertyRepository = PropertyRepositoryImplementation(dataSource: PropertyDataSource())) {
        
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Property], Error> {
        
        return repository.getPropertyList()
    }
}
