//
//  ServerDetailImageTests.swift
//  iOSChallengeTests
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge
import XCTest

class ServerDetailImageTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverDetailImage = ServerDetailImage.mock()
        
        // When
        let detailImage = serverDetailImage.convertToEntity()
        
        // Then
        XCTAssertEqual(detailImage.url, serverDetailImage.url)
        XCTAssertEqual(detailImage.tag, serverDetailImage.tag)
        XCTAssertEqual(detailImage.localizedName, serverDetailImage.localizedName)
        XCTAssertEqual(detailImage.multimediaId, serverDetailImage.multimediaId)
    }
}
