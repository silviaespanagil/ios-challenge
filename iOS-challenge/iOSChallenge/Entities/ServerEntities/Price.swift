//
//  Price.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Foundation

struct Price: Codable {
    
    let amount: Double
    let currencySuffix: String
    
    enum CodingKeys: String, CodingKey {
        case amount, currencySuffix
    }
}
