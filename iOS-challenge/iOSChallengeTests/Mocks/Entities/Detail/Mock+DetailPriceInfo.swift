//
//  Mock+DetailPriceiInfo.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

@testable import iOSChallenge

extension DetailPriceInfo {
    
    static func mock() -> DetailPriceInfo {
        
        return DetailPriceInfo(amount: 1195000.0, currencySuffix: "€")
    }
}
