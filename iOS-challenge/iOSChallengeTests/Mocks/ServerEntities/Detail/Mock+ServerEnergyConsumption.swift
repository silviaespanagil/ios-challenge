//
//  Mock+ServerEnergyConsumption.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge

extension ServerEnergyConsumption {
    
    static func mock() -> ServerEnergyConsumption {
        
        return ServerEnergyConsumption(type: "e")
    }
}
