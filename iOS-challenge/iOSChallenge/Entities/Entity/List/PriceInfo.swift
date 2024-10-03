//
//  PriceInfo.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

import Foundation

struct PriceInfo: Codable {
    
    let price: Price
    
    enum CodingKeys: String, CodingKey {
        case price
    }
}
