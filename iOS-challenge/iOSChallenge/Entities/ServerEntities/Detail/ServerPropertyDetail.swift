//
//  ServerPropertyDetail.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import Foundation

struct ServerPropertyDetail: Codable {
    
    let id: Int
    let price: Double
    let priceInfo: ServerDetailPriceInfo
    let operation: String
    let propertyType: String
    let extendedPropertyType: String
    let homeType: String
    let state: String
    let multimedia: ServerDetailMultimedia
    let propertyComment: String
    let ubication: ServerUbication
    let country: String
    let moreCharacteristics: ServerPropertyCharacteristics
    let energyCertification: ServerEnergyCertification
    
    enum CodingKeys: String, CodingKey {
        case id = "adid"
        case price, priceInfo, operation, propertyType, extendedPropertyType, homeType, state, multimedia, propertyComment, ubication, country, moreCharacteristics, energyCertification
    }
    
    func convertToEntity() -> PropertyDetail {
        
        return PropertyDetail(id: id, price: price, priceInfo: priceInfo.convertToEntity(), operation: operation, propertyType: propertyType, extendedPropertyType: extendedPropertyType, homeType: homeType, state: state, multimedia: multimedia.convertToEntity(), propertyComment: propertyComment, ubication: ubication.convertToEntity(), country: country, moreCharacteristics: moreCharacteristics.convertToEntity(), energyCertification: energyCertification.convertToEntity())
    }
}
