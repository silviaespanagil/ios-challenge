//
//  Mock+Ubication.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//


@testable import iOSChallenge

extension Ubication {
    
    static func mock() -> Ubication {
        
        return Ubication(latitude: 40.4362687, longitude: -3.6833686)
    }
}
