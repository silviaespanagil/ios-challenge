//
//  ServerPropertyCharacteristics.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

struct ServerPropertyCharacteristics: Codable {
    
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
    
    func convertToEntity() -> PropertyCharacteristics {
        
        return PropertyCharacteristics(communityCosts: communityCosts,
                                       roomNumber: roomNumber,
                                       bathNumber: bathNumber,
                                       exterior: exterior,
                                       housingFurnitures: housingFurnitures,
                                       agencyIsABank: agencyIsABank,
                                       energyCertificationType: energyCertificationType,
                                       flatLocation: flatLocation,
                                       modificationDate: modificationDate,
                                       constructedArea: constructedArea,
                                       lift: lift,
                                       boxroom: boxroom,
                                       isDuplex: isDuplex,
                                       floor: floor,
                                       status: status)
    }
}
