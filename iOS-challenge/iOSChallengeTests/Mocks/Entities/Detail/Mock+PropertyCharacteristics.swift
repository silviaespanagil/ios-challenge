//
//  Mock+PropertyCharacteristics.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

@testable import iOSChallenge

extension PropertyCharacteristics {
    
    static func mock() -> PropertyCharacteristics {
        
        return PropertyCharacteristics(communityCosts: 330.0,
                                       roomNumber: 3,
                                       bathNumber: 3,
                                       exterior: false,
                                       housingFurnitures: "unknown",
                                       agencyIsABank: false,
                                       energyCertificationType: "e",
                                       flatLocation: "internal",
                                       modificationDate: 1727683968000,
                                       constructedArea: 133,
                                       lift: false,
                                       boxroom: false,
                                       isDuplex: false,
                                       floor: "2",
                                       status: "renew")
    }
}
