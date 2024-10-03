//
//  ServerPrice.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Foundation

struct ServerPrice: Codable {
    
    let amount: Double
    let currencySuffix: String
    
    enum CodingKeys: String, CodingKey {
        case amount, currencySuffix
    }
    
    func convertToEntity() -> Price {
        
        return Price(amount: amount,
                     currencySuffix: currencySuffix)
    }
}
