//
//  ServerPropertyTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

import XCTest
@testable import iOSChallenge

class ServerPropertyTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverPriceInfo = ServerPriceInfo(price: ServerPrice(amount: 250000.0, currencySuffix: "EUR"))
        let serverMultimedia = ServerMultimedia(images: [ServerImage(url: "http://jsonplaceholder.typicode.com/", tag: "Mock image")])
        
        let serverProperty = ServerProperty(id: "12345",
                                            thumbnail: "https://example.com/thumbnail.jpg",
                                            floor: "2",
                                            price: 250000.0,
                                            priceInfo: serverPriceInfo,
                                            propertyType: "Apartment",
                                            operation: "Sale",
                                            size: 80.0,
                                            exterior: true,
                                            rooms: 3,
                                            bathrooms: 2,
                                            address: "123 Main St",
                                            province: "Barcelona",
                                            municipality: "Barcelona",
                                            district: "Barcelona",
                                            country: "Spain",
                                            neighborhood: "Gracia",
                                            latitude: 41.397738,
                                            longitude: 2.190471,
                                            description: "A beautiful apartment in the heart of the city.",
                                            multimedia: serverMultimedia,
                                            features: [
                                                "Swimming Pool": true,
                                                "Gym": false,
                                                "Balcony": true
                                            ])
        
        // When
        let property = serverProperty.convertToEntity()
        
        // Then
        XCTAssertEqual(property.id, serverProperty.id)
        XCTAssertEqual(property.thumbnail, serverProperty.thumbnail)
        XCTAssertEqual(property.floor, serverProperty.floor)
        XCTAssertEqual(property.price, serverProperty.price)
        XCTAssertEqual(property.propertyType, serverProperty.propertyType)
        XCTAssertEqual(property.operation, serverProperty.operation)
        XCTAssertEqual(property.size, serverProperty.size)
        XCTAssertEqual(property.exterior, serverProperty.exterior)
        XCTAssertEqual(property.rooms, serverProperty.rooms)
        XCTAssertEqual(property.bathrooms, serverProperty.bathrooms)
        XCTAssertEqual(property.address, serverProperty.address)
        XCTAssertEqual(property.province, serverProperty.province)
        XCTAssertEqual(property.municipality, serverProperty.municipality)
        XCTAssertEqual(property.district, serverProperty.district)
        XCTAssertEqual(property.country, serverProperty.country)
        XCTAssertEqual(property.neighborhood, serverProperty.neighborhood)
        XCTAssertEqual(property.latitude, serverProperty.latitude)
        XCTAssertEqual(property.longitude, serverProperty.longitude)
        XCTAssertEqual(property.description, serverProperty.description)
        XCTAssertEqual(property.features, serverProperty.features)
    }
}
