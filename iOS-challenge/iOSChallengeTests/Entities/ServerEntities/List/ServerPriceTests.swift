//
//  ServerPriceTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

import XCTest
@testable import iOSChallenge

class ServerPriceTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverPrice = ServerPrice(amount: 100, currencySuffix: "€")
        
        // When
        let price = serverPrice.convertToEntity()
        
        // Then
        XCTAssertEqual(price.amount, serverPrice.amount)
        XCTAssertEqual(price.currencySuffix, serverPrice.currencySuffix)
    }
}
