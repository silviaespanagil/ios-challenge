//
//  PropertyDataSourceTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

@testable import iOSChallenge
import XCTest
import Combine

class PropertyDataSourceUnitTest: XCTestCase {
    
    var sut: PropertyDataSource!
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        sut = PropertyDataSource(baseURL: "https://idealista.github.io/ios-challenge/")
        cancellables = []
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        cancellables = nil
        
        try super.tearDownWithError()
    }
    
    func testPropertyListEndpoint() {
        
        // Given
        let expectedEndpoint = "https://idealista.github.io/ios-challenge/list.json"
        
        // When
        let endpoint = "\(sut.baseURLString)\(PropertyDataSource.propertyListEndpoint)"
        
        // Then
        XCTAssertEqual(endpoint, expectedEndpoint)
    }
    
    func testGetPropertyListSuccess() {
        
        // Given
        let expectation = self.expectation(description: "getPropertyList completes")
        
        // When
        sut.getPropertyList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
            }, receiveValue: { properties in
                // Then
                XCTAssertNotNil(properties)
                XCTAssertGreaterThan(properties.count, 0)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testPropertyDetailEndpoint() {
        
        // Given
        let expectedEndpoint = "https://idealista.github.io/ios-challenge/detail.json"
        
        // When
        let endpoint = "\(sut.baseURLString)\(PropertyDataSource.propertyDetailEndpoint)"
        
        // Then
        XCTAssertEqual(endpoint, expectedEndpoint)
    }
    
    func testGetPropertyDetailSuccess() {
        
        // Given
        let expectation = self.expectation(description: "getPropertyDetail completes")
        
        // When
        sut.getPropertyDetail()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
            }, receiveValue: { detail in
                // Then
                XCTAssertNotNil(detail)
                XCTAssertEqual(detail.id, 1)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
    }
}
