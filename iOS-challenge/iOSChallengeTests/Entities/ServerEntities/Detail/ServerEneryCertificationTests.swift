//
//  ServerEneryCertificationTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge
import XCTest

class ServerEneryCertificationTests: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let serverEnergyCertification = ServerEnergyCertification.mock()
        
        // When
        let energyCertification = serverEnergyCertification.convertToEntity()
        
        // Then
        XCTAssertEqual(energyCertification.title, serverEnergyCertification.title)
        XCTAssertEqual(energyCertification.emissions.type, serverEnergyCertification.emissions.type)
        XCTAssertEqual(energyCertification.energyConsumption.type, serverEnergyCertification.energyConsumption.type)
    }
}
