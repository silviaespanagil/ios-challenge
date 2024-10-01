//
//  ServerImage.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Foundation

struct ServerImage: Codable {
    
    let url: String
    let tag: String
    
    enum CodingKeys: String, CodingKey {
        case url, tag
    }
}
