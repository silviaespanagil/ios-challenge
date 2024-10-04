//
//  Mock+ServerDetailMultimedia.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge

extension ServerDetailMultimedia {
    
    static func mock() -> ServerDetailMultimedia {
        
        return ServerDetailMultimedia(images: [ServerDetailImage.mock()])
    }
}
