//
//  Mock+ServerDetailImage.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge

extension ServerDetailImage {
    
    static func mock() -> ServerDetailImage {
        
        return ServerDetailImage(url: "http://jsonplaceholder.typicode.com/",
                                 tag: "Mock image",
                                 localizedName: "Mock",
                                 multimediaId: 1234)
    }
}
