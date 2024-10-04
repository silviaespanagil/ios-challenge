//
//  ServerUbicationTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

import XCTest
@testable import iOSChallenge

class ServerUbicationTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverUbication = ServerUbication.mock()
        
        // When
        let ubication = serverUbication.convertToEntity()
        
        // Then
        XCTAssertEqual(ubication.latitude, serverUbication.latitude)
        XCTAssertEqual(ubication.longitude, serverUbication.longitude)
    }
}
