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
    
    var formattedAmount: String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        
        return formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
    }
    
    enum CodingKeys: String, CodingKey {
        case amount, currencySuffix
    }
}
