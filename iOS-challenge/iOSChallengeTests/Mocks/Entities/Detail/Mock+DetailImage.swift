//
//  Mock+DetailImage.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

@testable import iOSChallenge

extension DetailImage {
    
    static func mockRoom() -> DetailImage {
        
        return DetailImage(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/58/60/32/1273036727.webp",
                           tag: "livingRoom",
                           localizedName: "Salón",
                           multimediaId: 1273036727)
        }
    
    static func mockView() -> DetailImage {
        return DetailImage(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/79/6b/e0/1273036729.webp",
                           tag: "views",
                           localizedName: "Vistas",
                           multimediaId: 1273036729)
    }
}
