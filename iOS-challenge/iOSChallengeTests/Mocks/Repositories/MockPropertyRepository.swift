//
//  MockPropertyRepository.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import Combine
import Foundation

@testable import iOSChallenge

class MockPropertyRepository: PropertyRepository {
    
    var isGetPropertyCalled = false
    var isGetPropertyDetailCalled = false
    
    func getPropertyList() -> AnyPublisher<[Property], any Error> {
        
        self.isGetPropertyCalled = true
        
        let properties = [Property.mock()]
        
        return Just(properties)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getPropertyDetail() -> AnyPublisher<PropertyDetail, any Error> {
        
        self.isGetPropertyDetailCalled = true
        
        let propertyDetail = PropertyDetail.mock()
        
        return Just(propertyDetail)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
