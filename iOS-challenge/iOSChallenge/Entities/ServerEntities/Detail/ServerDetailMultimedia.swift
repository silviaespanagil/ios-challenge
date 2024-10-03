//
//  ServerDetailMultimedia.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

struct ServerDetailMultimedia: Codable {
    
    let images: [ServerDetailImage]
    
    enum CodingKeys: String, CodingKey {
        case images
    }
    
    func convertToEntity() -> DetailMultimedia {
        
        let images = images.map { $0.convertToEntity() }
        
        return DetailMultimedia(images: images)
    }
}
