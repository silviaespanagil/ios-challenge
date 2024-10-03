//
//  DetailPriceInfo.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

struct DetailPriceInfo: Codable {
    
    let amount: Double
    let currencySuffix: String
    
    enum CodingKeys: String, CodingKey {
        case amount, currencySuffix
    }
}
