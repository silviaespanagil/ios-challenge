//
//  Mock+ServerEmissions.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge

extension ServerEmissions {
    
    static func mock() -> ServerEmissions {
        
        return ServerEmissions(type: "e")
    }
}
