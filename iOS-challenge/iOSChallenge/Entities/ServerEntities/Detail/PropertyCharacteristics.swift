//
//  PropertyCharacteristics.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

struct PropertyCharacteristics: Codable {
    
    let communityCosts: Double?
    let roomNumber: Int?
    let bathNumber: Int?
    let exterior: Bool?
    let housingFurnitures: String?
    let agencyIsABank: Bool?
    let energyCertificationType: String?
    let flatLocation: String?
    let modificationDate: Int64?
    let constructedArea: Double?
    let lift: Bool?
    let boxroom: Bool?
    let isDuplex: Bool?
    let floor: String?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        
        case communityCosts, roomNumber, bathNumber, exterior, housingFurnitures, agencyIsABank, energyCertificationType, flatLocation, modificationDate, constructedArea, lift, boxroom, isDuplex, floor, status
    }
}
