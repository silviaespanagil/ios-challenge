//
//  ServerPriceInfoTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

import XCTest
@testable import iOSChallenge

class ServerPriceInfoTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverPrice = ServerPrice(amount: 100, currencySuffix: "€")
        
        let serverPriceInfo = ServerPriceInfo(price: serverPrice)
        
        // When
        let priceInfo = serverPriceInfo.convertToEntity()
        
        // Then
        XCTAssertEqual(priceInfo.price.amount, serverPriceInfo.price.amount)
        XCTAssertEqual(priceInfo.price.currencySuffix, serverPriceInfo.price.currencySuffix)
    }
}
