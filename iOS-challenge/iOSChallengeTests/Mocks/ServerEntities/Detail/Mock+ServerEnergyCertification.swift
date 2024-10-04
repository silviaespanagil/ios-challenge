//
//  Mock+ServerEnergyCertification.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge

extension ServerEnergyCertification {
    
    static func mock() -> ServerEnergyCertification {
        
        return ServerEnergyCertification(title: "Certificación", energyConsumption: ServerEnergyConsumption.mock(), emissions: ServerEmissions.mock())
    }
}
