//
//  PropertyDetailLocalization.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 5/10/24.
//

import Foundation

struct PropertyDetailLocalization {
    
    // MARK: - Static Strings
    let viewMapButton: String
    let approximateLocation: String
    let favoritesSince: String
    let additionalCharacteristics: String
    let habAbbreviation: String
    let bathsAbbreviation: String
    let squareMetersAbbreviation: String
    
    init(viewMapButton: String = NSLocalizedString("property_detail_button_view_map", comment: "View map button"),
         approximateLocation: String = NSLocalizedString("property_detail_map_label_approximate_location", comment: "Approximate location title"),
         favoritesSince: String = NSLocalizedString("property_detail_favorite_since", comment: "Favorite since date"),
         additionalCharacteristics: String = NSLocalizedString("property_detail_section_additional_characteristics", comment: "Additional characteristics title"),
         habAbbreviation: String = NSLocalizedString("property_detail_info_hab", comment: "Rooms abbreviation"),
         bathsAbbreviation: String = NSLocalizedString("property_detail_info_bath", comment: "Bathrooms abbreviation"),
         squareMetersAbbreviation: String = NSLocalizedString("property_detail_info_metters", comment: "Square meters abbreviation")
    ) {
        self.viewMapButton = viewMapButton
        self.approximateLocation = approximateLocation
        self.favoritesSince = favoritesSince
        self.additionalCharacteristics = additionalCharacteristics
        self.habAbbreviation = habAbbreviation
        self.bathsAbbreviation = bathsAbbreviation
        self.squareMetersAbbreviation = squareMetersAbbreviation
    }
}

extension PropertyDetailLocalization {
    
    // MARK: - Dynamic Strings
    func propertyTypeAndOperation(_ type: String, operation: String) -> String {
        
        let localizedPropertyType = NSLocalizedString("property_type_\(type.lowercased())", comment: "Property type")
        
        let localizedOperation = NSLocalizedString("operation_\(operation.lowercased())", comment: "Operation type")
        
        return String(format: NSLocalizedString("property_detail_format_type_operation",
                                                comment: "Property type and operation  e.g. 'Apartment for Sale'"), localizedPropertyType, localizedOperation)
    }
    
    func neighborhoodAndMunicipality(_ neighborhood: String, municipality: String) -> String {
        
        String(format: NSLocalizedString("%@, %@", comment: "Neighborhood and municipality"), neighborhood, municipality)
    }
    
    func formattedPrice(_ amount: String, currency: String) -> String {
        
        var localizedCurrency = currency
        
        if currency.contains("/mes") {
            let localizedSuffix = NSLocalizedString("price_suffix_month", comment: "Localized suffix for monthly pricing")
            
            localizedCurrency = currency.replacingOccurrences(of: "/mes", with: localizedSuffix)
        }
        
        return String(format: NSLocalizedString("property_card_price", comment: "Format: {Amount} {Currency Symbol}, e.g. '250000.00 €'"), amount, localizedCurrency)
    }
    
    func favoriteSinceDate(_ date: Date) -> String {
        
        String(format: NSLocalizedString(favoritesSince, comment: "Favorite since date"), date.formattedDate())
    }
    
    func roomsInfoText(_ count: Int) -> String {
        
        String(format: NSLocalizedString("%d \(habAbbreviation)", comment: "Number of rooms"), count)
    }
    
    func bathroomsInfoText(_ count: Int) -> String {
        
        String(format: NSLocalizedString("%d \(bathsAbbreviation)", comment: "Number of bathrooms"), count)
    }
    
    func sizeInfoText(_ size: String) -> String {
        
        String(format: NSLocalizedString("%@ \(squareMetersAbbreviation)", comment: "Size in square meters"), size)
    }
}

extension PropertyDetailLocalization {
    
    func additionalCharacteristics(_ key: String) -> String {
        
        switch key {
            
        case "roomNumber":
            return NSLocalizedString("property_detail_room_number", comment: "Room number text")
        case "bathNumber":
            return NSLocalizedString("property_detail_bath_number", comment: "Bathroom number text")
        case "lift":
            return NSLocalizedString("property_detail_lift", comment: "Lift available text")
        case "flatLocation":
            return NSLocalizedString("property_detail_location", comment: "Flat location text")
        case "constructedArea":
            return NSLocalizedString("property_detail_constructed_area", comment: "Constructed area text")
        case "energyCertification":
            return NSLocalizedString("property_detail_energy_certification", comment: "Energy certification text")
        default:
            return key
        }
    }
}
