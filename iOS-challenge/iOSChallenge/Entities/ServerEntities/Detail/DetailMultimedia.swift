//
//  DetailMultimedia.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

struct DetailMultimedia: Codable {
    
    let images: [DetailImage]
    
    enum CodingKeys: String, CodingKey {
        case images
    }
}
