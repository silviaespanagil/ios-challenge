//
//  Mock+ServerImage.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 5/10/24.
//

@testable import iOSChallenge

extension ServerImage {
    
    static func mock() -> ServerImage {
        
        return ServerImage(url: "http://jsonplaceholder.typicode.com/",
                           tag: "Mock image")
    }
}
