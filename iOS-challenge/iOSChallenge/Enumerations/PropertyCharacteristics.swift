//
//  PropertyCharacteristics.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

enum PropertyCharacteristics: Codable {
    
    case communityCosts(Double)
    case roomNumber(Int)
    case bathNumber(Int)
    case exterior(Bool)
    case housingFurnitures(String)
    case agencyIsABank(Bool)
    case energyCertificationType(String)
    case flatLocation(String)
    case modificationDate(Int64)
    case constructedArea(Double)
    case lift(Bool)
    case boxroom(Bool)
    case isDuplex(Bool)
    case floor(String)
    case status(String)
}

