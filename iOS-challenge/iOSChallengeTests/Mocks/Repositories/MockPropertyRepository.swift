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
    
    func getPropertyList() -> AnyPublisher<[Property], any Error> {
        
        self.isGetPropertyCalled = true
        
        let properties = [Property.mock()]
        
        return Just(properties)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
