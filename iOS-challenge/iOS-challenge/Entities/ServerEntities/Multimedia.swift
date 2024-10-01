//
//  Multimedia.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Foundation

struct Multimedia: Codable {
    
    let images: [ServerImage]
    
    enum CodingKeys: String, CodingKey {
        case images
    }
}
