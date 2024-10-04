//
// FavoritesManagerTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge
import XCTest

class FavoritesManagerTests: XCTestCase {
    
    var sut: FavoritesManager!
    var favoriteProperty: Property!
    var nonFavoriteProperty: Property!
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        sut = FavoritesManager()
        favoriteProperty = Property.mock(isFavorite: true)
        nonFavoriteProperty = Property.mock()
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        favoriteProperty = nil
        nonFavoriteProperty = nil
        
        try super.tearDownWithError()
    }
    
    func testAddFavorite() {
        
        // Given
        let property = nonFavoriteProperty!
        
        // When
        _ = sut.addFavorite(property)
        
        // Then
        XCTAssertTrue(sut.isFavorite(property))
    }
    
    func testRemoveFavorite() {
        
        // Given
        let property = favoriteProperty!
        
        // When
        sut.removeFavorite(property)
        
        // Then
        XCTAssertFalse(sut.isFavorite(property))
    }
    
    func testToggleFavoriteShouldRemoveFavorite() {
        
        // Given
        let property = favoriteProperty!
        
        // When
        let result = sut.toggleFavorite(property)
        
        // Then
        XCTAssertFalse(result.isFavorite)
        XCTAssertFalse(sut.isFavorite(property))
    }
    
    func testToggleFavoriteShouldAddFavorite() {
        
        // Given
        let property = nonFavoriteProperty!
        
        // When
        let result = sut.toggleFavorite(property)
        
        // Then
        XCTAssertTrue(result.isFavorite)
        XCTAssertTrue(sut.isFavorite(property))
    }
    
    func testGetFavoritePropertyIsFavorite() {
        
        //Given
        let property = favoriteProperty!
        _ = sut.addFavorite(property)
        
        // When
        let favorite = sut.getFavorite(property)
        
        // Then
        XCTAssertTrue(favorite.isFavorite)
        XCTAssertEqual(favorite.id, property.id)
    }
    
    func testGetFavoritePropertyIsNotFavorite() {
        
        //Given
        let property = favoriteProperty!
        sut.removeFavorite(property)
        
        // When
        let favorite = sut.getFavorite(property)
        
        // Then
        XCTAssertFalse(favorite.isFavorite)
        XCTAssertEqual(favorite.id, property.id)
    }
}
