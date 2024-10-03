//
//  ServerUbication.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import Foundation

struct ServerUbication: Codable {
    
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude
    }
    
    func convertToEntity() -> Ubication {
        return Ubication(latitude: latitude,
                         longitude: longitude)
    }
}
