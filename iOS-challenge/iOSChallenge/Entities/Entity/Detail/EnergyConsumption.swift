//
//  EnergyConsumption.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

struct EnergyConsumption: Codable {
    
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case type
    }
}
