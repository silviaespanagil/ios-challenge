//
//  Mock+PriceInfo.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

@testable import iOSChallenge

extension PriceInfo {
    
    static func mock() -> PriceInfo {
        
        return PriceInfo(price: Price(amount: 250000.0, currencySuffix: "EUR"))}
}
