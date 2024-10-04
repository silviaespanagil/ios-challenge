//
//  ServerImageTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

import XCTest
@testable import iOSChallenge

class ServerImageTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverImage = ServerImage(url: "http://jsonplaceholder.typicode.com/", tag: "Mock image")
        
        // When
        let image = serverImage.convertToEntity()
        
        // Then
        XCTAssertEqual(image.url, serverImage.url)
        XCTAssertEqual(image.tag, serverImage.tag)
    }
}
