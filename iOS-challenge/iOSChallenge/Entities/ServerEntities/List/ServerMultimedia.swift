//
//  ServerMultimedia.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Foundation

struct ServerMultimedia: Codable, Hashable {
    
    let images: [ServerImage]
    
    enum CodingKeys: String, CodingKey {
        case images
    }
    
    func convertToEntity() -> Multimedia {
        
        let multimedia = images.map { $0.convertToEntity() }
        
        return Multimedia(images: multimedia)
    }
}
