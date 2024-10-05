//
//  DateTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 5/10/24.
//

@testable import iOSChallenge
import XCTest

class DateExtensionTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testFormattedDate() {
        
        // Given
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let date = dateFormatter.date(from: "2024/10/05")!
        
        // When
        let formattedDate = date.formattedDate()
        
        // Then
        XCTAssertEqual(formattedDate, "05/10/24")
    }
}
