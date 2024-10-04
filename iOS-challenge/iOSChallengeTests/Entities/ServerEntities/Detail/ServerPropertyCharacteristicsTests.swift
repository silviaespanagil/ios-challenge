//
//  ServerPropertyCharacteristicsTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

import XCTest
@testable import iOSChallenge

class ServerPropertyCharacteristicsTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverPropertyCharacteristics = ServerPropertyCharacteristics.mock()
        
        // When
        let propertyCharacteristics = serverPropertyCharacteristics.convertToEntity()
        
        // Then
        XCTAssertEqual(propertyCharacteristics.communityCosts, serverPropertyCharacteristics.communityCosts)
        XCTAssertEqual(propertyCharacteristics.roomNumber, serverPropertyCharacteristics.roomNumber)
        XCTAssertEqual(propertyCharacteristics.bathNumber, serverPropertyCharacteristics.bathNumber)
        XCTAssertEqual(propertyCharacteristics.exterior, serverPropertyCharacteristics.exterior)
        XCTAssertEqual(propertyCharacteristics.housingFurnitures, serverPropertyCharacteristics.housingFurnitures)
        XCTAssertEqual(propertyCharacteristics.agencyIsABank, serverPropertyCharacteristics.agencyIsABank)
        XCTAssertEqual(propertyCharacteristics.energyCertificationType, serverPropertyCharacteristics.energyCertificationType)
        XCTAssertEqual(propertyCharacteristics.flatLocation, serverPropertyCharacteristics.flatLocation)
        XCTAssertEqual(propertyCharacteristics.modificationDate, serverPropertyCharacteristics.modificationDate)
        XCTAssertEqual(propertyCharacteristics.constructedArea, serverPropertyCharacteristics.constructedArea)
        XCTAssertEqual(propertyCharacteristics.lift, serverPropertyCharacteristics.lift)
        XCTAssertEqual(propertyCharacteristics.boxroom, serverPropertyCharacteristics.boxroom)
        XCTAssertEqual(propertyCharacteristics.isDuplex, serverPropertyCharacteristics.isDuplex)
        XCTAssertEqual(propertyCharacteristics.floor, serverPropertyCharacteristics.floor)
        XCTAssertEqual(propertyCharacteristics.status, serverPropertyCharacteristics.status)
    }
}
