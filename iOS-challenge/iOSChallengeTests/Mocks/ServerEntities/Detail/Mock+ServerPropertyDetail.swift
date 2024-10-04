//
//  Mock+ServerPropertyDetail.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 4/10/24.
//

@testable import iOSChallenge

extension ServerPropertyDetail {
    
    static func mock() -> ServerPropertyDetail {
        
        return ServerPropertyDetail(id: 1,
                                    price: 1195000.0,
                                    priceInfo: ServerDetailPriceInfo(amount: 1195000.0, currencySuffix: "€"),
                                    operation: "sale",
                                    propertyType: "homes",
                                    extendedPropertyType: "flat",
                                    homeType: "flat",
                                    state: "active",
                                    multimedia: ServerDetailMultimedia.mock(),
                                    propertyComment: "Piso en venta...",
                                    ubication: ServerUbication.mock(),
                                    country: "es",
                                    moreCharacteristics: ServerPropertyCharacteristics.mock(),
                                    energyCertification: ServerEnergyCertification.mock())
    }
}
