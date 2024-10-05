//
//  Mock+ServerProperty.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 5/10/24.
//

@testable import iOSChallenge

extension ServerProperty {
    
    static func mock() -> ServerProperty {
        
        let serverPriceInfo = ServerPriceInfo.mock()
        let serverMultimedia = ServerMultimedia.mock()
        
        return ServerProperty(id: "12345",
                              thumbnail: "https://example.com/thumbnail.jpg",
                              floor: "2",
                              price: 250000.0,
                              priceInfo: serverPriceInfo,
                              propertyType: "Apartment",
                              operation: "Sale",
                              size: 80.0,
                              exterior: true,
                              rooms: 3,
                              bathrooms: 2,
                              address: "123 Main St",
                              province: "Barcelona",
                              municipality: "Barcelona",
                              district: "Barcelona",
                              country: "Spain",
                              neighborhood: "Gracia",
                              latitude: 41.397738,
                              longitude: 2.190471,
                              description: "A beautiful apartment in the heart of the city.",
                              multimedia: serverMultimedia,
                              features: [
                                "Swimming Pool": true,
                                "Gym": false,
                                "Balcony": true
                              ])
    }
}
