//
//  Mock+ServerUbication.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge

extension ServerUbication {
    
    static func mock() -> ServerUbication {
        
        return ServerUbication(latitude: 40.416775, longitude: -3.703790)
    }
}
