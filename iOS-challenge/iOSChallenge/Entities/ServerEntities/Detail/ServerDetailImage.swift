//
//  ServerDetailImage.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

struct ServerDetailImage: Codable {
    
    let url: String
    let tag: String
    let localizedName: String
    let multimediaId: Int
    
    enum CodingKeys: String, CodingKey {
        case url, tag, localizedName, multimediaId
    }
    
    func convertToEntity() -> DetailImage {
        
        return DetailImage(url: url,
                           tag: tag,
                           localizedName: localizedName,
                           multimediaId: multimediaId)
    }
}
