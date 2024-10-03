//
//  Mock+Certification.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

@testable import iOSChallenge

extension EnergyCertification {
    
    static func mock() -> EnergyCertification {
        
        return EnergyCertification(title: "Certificado energético",
                                   energyConsumption: EnergyConsumption(type: "e"),
                                   emissions: Emissions(type: "e"))
    }
}
