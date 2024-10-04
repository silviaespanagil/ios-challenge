//
//  ServerEmissionsTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge
import XCTest

class ServerEmissionsTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverEmissions = ServerEmissions.mock()
        
        // When
        let emissions = serverEmissions.convertToEntity()
        
        // Then
        XCTAssertEqual(emissions.type, serverEmissions.type)
    }
}
