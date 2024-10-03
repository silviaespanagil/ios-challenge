//
//  Ubication.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import Foundation

struct Ubication: Codable {
    
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude
    }
}
