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
        
        return dataSource.getPropertyList().map { serverPropertyList in
            
            let propertyList = serverPropertyList.map { $0.convertToEntity() }
            
            return propertyList
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
    
    func getPropertyDetail() -> AnyPublisher<PropertyDetail, Error> {
        
        return dataSource.getPropertyDetail().map { serverPropertyDetail in
            
            let detail = serverPropertyDetail.convertToEntity()
            
            return detail
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
}
