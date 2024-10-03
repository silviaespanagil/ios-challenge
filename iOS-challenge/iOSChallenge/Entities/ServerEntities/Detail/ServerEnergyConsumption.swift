//
//  ServerEnergyConsumption.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

struct ServerEnergyConsumption: Codable {
    
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case type
    }
    
    func convertToEntity() -> EnergyConsumption {
        
        return EnergyConsumption(type: type)
    }
}
