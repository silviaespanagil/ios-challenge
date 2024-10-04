//
//  ServerDetailTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

import XCTest
@testable import iOSChallenge

class ServerPropertyDetailTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverPropertyDetail = ServerPropertyDetail.mock()
        
        // When
        let propertyDetail = serverPropertyDetail.convertToEntity()
        
        
        // Then
        XCTAssertEqual(propertyDetail.id, serverPropertyDetail.id)
        XCTAssertEqual(propertyDetail.price, serverPropertyDetail.price)
        XCTAssertEqual(propertyDetail.priceInfo.amount, serverPropertyDetail.priceInfo.amount)
        XCTAssertEqual(propertyDetail.priceInfo.currencySuffix, serverPropertyDetail.priceInfo.currencySuffix)
        XCTAssertEqual(propertyDetail.operation, serverPropertyDetail.operation)
        XCTAssertEqual(propertyDetail.propertyType, serverPropertyDetail.propertyType)
        XCTAssertEqual(propertyDetail.extendedPropertyType, serverPropertyDetail.extendedPropertyType)
        XCTAssertEqual(propertyDetail.homeType, serverPropertyDetail.homeType)
        XCTAssertEqual(propertyDetail.state, serverPropertyDetail.state)
        XCTAssertEqual(propertyDetail.multimedia.images.count, serverPropertyDetail.multimedia.images.count)
        XCTAssertEqual(propertyDetail.propertyComment, serverPropertyDetail.propertyComment)
        XCTAssertEqual(propertyDetail.ubication.latitude, serverPropertyDetail.ubication.latitude)
        XCTAssertEqual(propertyDetail.ubication.longitude, serverPropertyDetail.ubication.longitude)
        XCTAssertEqual(propertyDetail.country, serverPropertyDetail.country)
        XCTAssertEqual(propertyDetail.moreCharacteristics.communityCosts, serverPropertyDetail.moreCharacteristics.communityCosts)
        XCTAssertEqual(propertyDetail.moreCharacteristics.roomNumber, serverPropertyDetail.moreCharacteristics.roomNumber)
        XCTAssertEqual(propertyDetail.moreCharacteristics.bathNumber, serverPropertyDetail.moreCharacteristics.bathNumber)
        XCTAssertEqual(propertyDetail.moreCharacteristics.exterior, serverPropertyDetail.moreCharacteristics.exterior)
        XCTAssertEqual(propertyDetail.moreCharacteristics.housingFurnitures, serverPropertyDetail.moreCharacteristics.housingFurnitures)
        XCTAssertEqual(propertyDetail.moreCharacteristics.agencyIsABank, serverPropertyDetail.moreCharacteristics.agencyIsABank)
        XCTAssertEqual(propertyDetail.moreCharacteristics.energyCertificationType, serverPropertyDetail.moreCharacteristics.energyCertificationType)
        XCTAssertEqual(propertyDetail.moreCharacteristics.flatLocation, serverPropertyDetail.moreCharacteristics.flatLocation)
        XCTAssertEqual(propertyDetail.moreCharacteristics.modificationDate, serverPropertyDetail.moreCharacteristics.modificationDate)
        XCTAssertEqual(propertyDetail.moreCharacteristics.constructedArea, serverPropertyDetail.moreCharacteristics.constructedArea)
        XCTAssertEqual(propertyDetail.moreCharacteristics.lift, serverPropertyDetail.moreCharacteristics.lift)
        XCTAssertEqual(propertyDetail.moreCharacteristics.boxroom, serverPropertyDetail.moreCharacteristics.boxroom)
        XCTAssertEqual(propertyDetail.moreCharacteristics.isDuplex, serverPropertyDetail.moreCharacteristics.isDuplex)
        XCTAssertEqual(propertyDetail.moreCharacteristics.floor, serverPropertyDetail.moreCharacteristics.floor)
        XCTAssertEqual(propertyDetail.moreCharacteristics.status, serverPropertyDetail.moreCharacteristics.status)
        XCTAssertEqual(propertyDetail.energyCertification.title, serverPropertyDetail.energyCertification.title)
        XCTAssertEqual(propertyDetail.energyCertification.energyConsumption.type, serverPropertyDetail.energyCertification.energyConsumption.type)
        XCTAssertEqual(propertyDetail.energyCertification.emissions.type, serverPropertyDetail.energyCertification.emissions.type)
    }
}
