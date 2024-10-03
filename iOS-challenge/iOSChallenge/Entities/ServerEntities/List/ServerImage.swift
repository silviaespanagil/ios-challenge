//
//  ServerImage.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Foundation

struct ServerImage: Codable, Hashable {
    
    let url: String
    let tag: String
    
    enum CodingKeys: String, CodingKey {
        case url, tag
    }
    
    func convertToEntity() -> PropertyImage {
        
        return PropertyImage(url: url,
                             tag: tag)
    }
}
