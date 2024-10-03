//
//  DetailImage.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

struct DetailImage: Codable, Hashable {
    
    let url: String
    let tag: String
    let localizedName: String
    let multimediaId: Int
    
    enum CodingKeys: String, CodingKey {
        case url, tag, localizedName, multimediaId
    }
}
