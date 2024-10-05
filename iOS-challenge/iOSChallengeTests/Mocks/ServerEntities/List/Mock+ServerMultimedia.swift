//
//  Mock+ServerMultimedia.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 5/10/24.
//

@testable import iOSChallenge

extension ServerMultimedia {
    
    static func mock() -> ServerMultimedia {
        
        let images = ServerImage.mock()
        
        return ServerMultimedia(images: [images])
    }
}
