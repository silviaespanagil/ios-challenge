//
//  ServerDetailMultimediaTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge
import XCTest

class ServerDetailMultimediaTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverDetailImage = ServerDetailImage.mock()
        
        let serverDetailMultimedia = ServerDetailMultimedia(images: [serverDetailImage])
        
        // When
        let detailMultimedia = serverDetailMultimedia.convertToEntity()
        
        // Then
        XCTAssertEqual(detailMultimedia.images[0].url, serverDetailMultimedia.images[0].url)
        XCTAssertEqual(detailMultimedia.images[0].tag, serverDetailMultimedia.images[0].tag)
        XCTAssertEqual(detailMultimedia.images[0].localizedName, serverDetailMultimedia.images[0].localizedName)
        XCTAssertEqual(detailMultimedia.images[0].multimediaId, serverDetailMultimedia.images[0].multimediaId)
    }
}
