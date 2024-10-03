//
//  Multimedia.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

import Foundation

struct Multimedia: Codable, Hashable {
    
    let images: [PropertyImage]
    
    enum CodingKeys: String, CodingKey {
        case images
    }
}
