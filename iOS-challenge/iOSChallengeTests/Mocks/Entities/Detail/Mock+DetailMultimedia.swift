//
//  Mock+DetailMultimedia.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

@testable import iOSChallenge

extension DetailMultimedia {
    
    static func mock() -> DetailMultimedia {
        
        return DetailMultimedia(images: [.mockRoom(), .mockView()])
    }
}
