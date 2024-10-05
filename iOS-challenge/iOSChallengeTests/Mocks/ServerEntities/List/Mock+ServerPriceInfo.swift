//
//  Mock+ServerPriceInfo.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 5/10/24.
//

@testable import iOSChallenge

extension ServerPriceInfo {
    
    static func mock() -> ServerPriceInfo {
        
        let price = ServerPrice.mock()
        
        return ServerPriceInfo(price: price)
    }
}
