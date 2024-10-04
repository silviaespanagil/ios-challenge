//
//  ServerDetailPriceInfoTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge
import XCTest

class ServerDetailPriceInfoTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverDetailPriceInfo = ServerDetailPriceInfo(amount: 100, currencySuffix: "€")
        
        // When
        let detailPriceInfo = serverDetailPriceInfo.convertToEntity()
        
        // Then
        XCTAssertEqual(detailPriceInfo.amount, serverDetailPriceInfo.amount)
        XCTAssertEqual(detailPriceInfo.currencySuffix, serverDetailPriceInfo.currencySuffix)
    }
}
