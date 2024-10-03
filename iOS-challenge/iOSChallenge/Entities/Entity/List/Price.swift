//
//  Price.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

import Foundation

struct Price: Codable {
    
    let amount: Double
    let currencySuffix: String
    
    enum CodingKeys: String, CodingKey {
        case amount, currencySuffix
    }
}
