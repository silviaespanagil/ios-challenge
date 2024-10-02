//
//  StringTests.swift
//  iOSChallengeTests
//
//  Created by Silvia España Gil on 2/10/24.
//

@testable import iOSChallenge
import XCTest

final class StringTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testCapitalizedFirstLetter() {
        
        // Given
        let testString = "hello"
        let testEmptyString = ""
        let testManyWordsString = "hello world"
        
        // When
        let capitalizedString = testString.capitalizedFirstLetter
        let capitalizedEmptyString = testEmptyString.capitalizedFirstLetter
        let capitalizedManyWordsString = testManyWordsString.capitalizedFirstLetter
        
        // Then
        XCTAssertEqual(capitalizedString, "Hello")
        XCTAssertEqual(capitalizedEmptyString, "")
        XCTAssertEqual(capitalizedManyWordsString, "Hello world")
    }
}
