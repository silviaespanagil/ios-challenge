//
//  PropertyRepository.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Combine

protocol PropertyRepository {
    
    func getPropertyList() -> AnyPublisher<[Property], Error>
    func getPropertyDetail() -> AnyPublisher<PropertyDetail, Error>
}
