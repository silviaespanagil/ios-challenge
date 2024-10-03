//
//  ServerEmissions.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

struct ServerEmissions: Codable {
    
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case type
    }
    
    func convertToEntity() -> Emissions {
        
        return Emissions(type: type)
    }
}
