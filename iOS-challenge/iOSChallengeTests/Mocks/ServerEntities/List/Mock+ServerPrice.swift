//
//  Mock+ServerPrice.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 5/10/24.
//

@testable import iOSChallenge

extension ServerPrice {
    
    static func mock() -> ServerPrice {
        
        return ServerPrice(amount: 100,
                           currencySuffix: "€")
    }
}
