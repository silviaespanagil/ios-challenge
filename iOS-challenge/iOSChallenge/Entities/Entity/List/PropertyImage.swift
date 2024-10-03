//
//  PropertyImage.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

struct PropertyImage: Codable, Hashable {
    
    let url: String
    let tag: String
    
    enum CodingKeys: String, CodingKey {
        case url, tag
    }
}
