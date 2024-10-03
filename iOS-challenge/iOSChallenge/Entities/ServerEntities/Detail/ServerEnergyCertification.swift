//
//  ServerEnergyCertification.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

struct ServerEnergyCertification: Codable {
    
    let title: String
    let energyConsumption: ServerEnergyConsumption
    let emissions: ServerEmissions
    
    enum CodingKeys: String, CodingKey {
        case title, energyConsumption, emissions
    }
    
    func convertToEntity() -> EnergyCertification {
        
        return EnergyCertification(title: title,
                                   energyConsumption: energyConsumption.convertToEntity(),
                                   emissions: emissions.convertToEntity())
    }
}
