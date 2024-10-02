//
//  UIImageViewTests.swift
//  iOSChallengeTests
//
//  Created by Silvia España Gil on 2/10/24.
//

@testable import iOSChallenge
import XCTest

final class UIImageViewTests: XCTestCase {
    
    var imageView: UIImageView!
    
    override func setUp() {
        
        super.setUp()
        
        imageView = UIImageView()
    }
    
    override func tearDown() {
        
        imageView = nil
        
        super.tearDown()
    }
    
    func testLoadImageFromURL() {
        
        // Given
        let urlString = "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp"
        
        guard let url = URL(string: urlString) else {
            XCTFail("Failed to create URL.")
            return
        }
        
        let expectation = XCTestExpectation(description: "Image should be loaded from URL.")
       
        // When
        imageView.loadImage(from: url)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // Then
            XCTAssertNotNil(self.imageView.image, "The image should be loaded from the URL.")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}
