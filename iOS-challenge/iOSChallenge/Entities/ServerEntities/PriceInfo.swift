//
//  PriceInfo.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Foundation

struct PriceInfo: Codable {
    
    let price: Price
    
    enum CodingKeys: String, CodingKey {
        case price
    }
}
