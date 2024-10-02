//
//  GetPropertyDetailUseCase.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import Foundation
import Combine

class GetPropertyDetailUseCase {
    
    private let repository: PropertyRepository
    
    init(repository: PropertyRepository = PropertyRepositoryImplementation(dataSource: PropertyDataSource())) {
        
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<PropertyDetail, Error> {
        
        return repository.getPropertyDetail()
    }
}
