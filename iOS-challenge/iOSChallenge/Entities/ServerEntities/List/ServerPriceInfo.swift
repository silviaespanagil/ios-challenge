//
//  ServerPriceInfo.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Foundation

struct ServerPriceInfo: Codable {
    
    let price: ServerPrice
    
    enum CodingKeys: String, CodingKey {
        case price
    }
    
    func convertToEntity() -> PriceInfo {
        
        return PriceInfo(price: price.convertToEntity())
    }
}
