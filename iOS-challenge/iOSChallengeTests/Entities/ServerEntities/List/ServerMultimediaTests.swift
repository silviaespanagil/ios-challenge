//
//  ServerMultimediaTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

import XCTest
@testable import iOSChallenge

class ServerMultimediaTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverImage = ServerImage(url: "http://jsonplaceholder.typicode.com/", tag: "Mock image")
        
        let serverMultimedia = ServerMultimedia(images: [serverImage])
        
        // When
        let multimedia = serverMultimedia.convertToEntity()
        
        // Then
        XCTAssertEqual(multimedia.images[0].url, serverMultimedia.images[0].url)
        XCTAssertEqual(multimedia.images[0].tag, serverMultimedia.images[0].tag)
    }
}
