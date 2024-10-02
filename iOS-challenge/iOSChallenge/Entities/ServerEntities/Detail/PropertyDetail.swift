//
//  PropertyDetail.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import Foundation

struct PropertyDetail: Codable {
    
    let id: Int
    let price: Double
    let priceInfo: PriceInfo
    let operation: String
    let propertyType: String
    let extendedPropertyType: String
    let homeType: String
    let state: String
    let multimedia: Multimedia
    let propertyComment: String
    let ubication: Ubication
    let country: String
    let moreCharacteristics: PropertyCharacteristics
    let energyCertification: EnergyCertification
    
    enum CodingKeys: String, CodingKey {
        case id = "adid"
        case price, priceInfo, operation, propertyType, extendedPropertyType, homeType, state, multimedia, propertyComment, ubication, country, moreCharacteristics, energyCertification
    }
}
