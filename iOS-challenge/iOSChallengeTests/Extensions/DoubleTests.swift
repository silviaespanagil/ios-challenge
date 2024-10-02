//
//  DoubleTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

@testable import iOSChallenge
import XCTest

class DoubleTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testFormattedDouble() {
        
        // Given
        let value: Double = 1234.56
        let valueWithFraction: Double = 1234.0
        
        // When
        let formattedValue = value.formattedDouble
        XCTAssertEqual(formattedValue, "1.235")
        
        // Then
        let formattedValueWithFraction = valueWithFraction.formattedDouble
        XCTAssertEqual(formattedValueWithFraction, "1.234")
    }
}
