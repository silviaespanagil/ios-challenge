//
//  PropertyCardLocalization.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 6/10/24.
//

import SwiftUI

struct PropertyCardLocalization {
    
    // MARK: - Static strings
    let rooms: String
    let bathrooms: String
    let squareMeters: String
    
    init(rooms: String = NSLocalizedString("property_card_label_rooms", comment: "Abbreviated form of 'rooms'"),
        bathrooms: String = NSLocalizedString("property_card_label_bathrooms", comment: "Word for bathrooms"),
        squareMeters: String = NSLocalizedString("property_card_label_square_meters", comment: "Abbreviated form of square meters")) {
        
        self.rooms = rooms
        self.bathrooms = bathrooms
        self.squareMeters = squareMeters
    }
}

extension PropertyCardLocalization {
    
    // MARK: - Dynamic Strings
    func propertyTypeOperationAndLocation(_ type: String, operation: String, neighborhood: String, municipality: String) -> String {
        
        let localizedPropertyType = NSLocalizedString("property_type_\(type.lowercased())", comment: "Property type")
        
        let localizedOperation = NSLocalizedString("operation_\(operation.lowercased())", comment: "Operation type")
        
        return String(format: NSLocalizedString("property_card_type_operation_location",
                                                comment: "Format: {Property Type} {Operation} - {Neighborhood}, {Municipality}, e.g. 'Apartment Sale - Gràcia, Barcelona'"), localizedPropertyType, localizedOperation, neighborhood, municipality)
    }
    
    func formattedPrice(_ amount: String, currency: String) -> String {
        
        var localizedCurrency = currency
        
        if currency.contains("/mes") {
            let localizedSuffix = NSLocalizedString("price_suffix_month", comment: "Localized suffix for monthly pricing")
            
            localizedCurrency = currency.replacingOccurrences(of: "/mes", with: localizedSuffix)
        }
        
        return String(format: NSLocalizedString("property_card_price",
                                                comment: "Format: {Amount} {Currency Symbol}, e.g. '250000.00 €'"), amount, localizedCurrency)
    }
    
    func formattedSize(_ size: String) -> String {
        String(format: NSLocalizedString("property_card_size",
                                         comment: "Format: {Size} m², e.g. '80.00 m²'"), size)
    }
    
    func formattedRooms(_ count: Int) -> String {
        String(format: NSLocalizedString("property_card_rooms",
                                         comment: "Format: {Count} rooms, e.g. '3 hab.'"), count)
    }
    
    func formattedBathrooms(_ count: Int) -> String {
        String(format: NSLocalizedString("property_card_bathrooms",
                                         comment: "Format: {Count} bathrooms, e.g. '2 baños'"), count)
    }
}
