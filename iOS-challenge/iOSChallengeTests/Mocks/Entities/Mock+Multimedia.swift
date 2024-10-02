//
//  Mock+Multimedia.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

@testable import iOSChallenge

extension Multimedia {
    
    static func mock() -> Multimedia {
        
        return Multimedia(images: [ServerImage(url: "http://jsonplaceholder.typicode.com/", tag: "Mock image")])}
}
