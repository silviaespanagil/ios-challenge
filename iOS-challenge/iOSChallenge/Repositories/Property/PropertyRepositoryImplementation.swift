//
//  PropertyRepositoryImplementation.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Combine

class PropertyRepositoryImplementation: PropertyRepository {
    
    private let dataSource: PropertyDataSource
    private var cancellables: Set<AnyCancellable> = []
    
    init(dataSource: PropertyDataSource) {
        
        self.dataSource = dataSource
    }
    
    func getPropertyList() -> AnyPublisher<[Property], Error> {
        
        dataSource.getPropertyList()
    }
    
    func getPropertyDetail() -> AnyPublisher<PropertyDetail, Error> {
        
        dataSource.getPropertyDetail()
    }
}
