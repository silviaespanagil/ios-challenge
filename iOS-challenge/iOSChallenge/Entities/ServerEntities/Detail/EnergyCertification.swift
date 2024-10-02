//
//  EnergyCertification.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

struct EnergyCertification: Codable {
    
    let title: String
    let energyConsumption: EnergyConsumption
    let emissions: Emissions
    
    enum CodingKeys: String, CodingKey {
        case title, energyConsumption, emissions
    }
}
