//
//  Property.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Foundation

struct Property: Codable, Identifiable {
    
    let id: String
    let thumbnail: String
    let floor: String
    let price: Double
    let priceInfo: PriceInfo
    let propertyType: String
    let operation: String
    let size: Double
    let exterior: Bool
    let rooms: Int
    let bathrooms: Int
    let address: String
    let province: String
    let municipality: String
    let district: String
    let country: String
    let neighborhood: String
    let latitude: Double
    let longitude: Double
    let description: String
    let multimedia: Multimedia
    let features: [String: Bool]
    
    enum CodingKeys: String, CodingKey {
        
        case id = "propertyCode"
        case thumbnail, floor, price, priceInfo, propertyType, operation, size, exterior, rooms, bathrooms, address, province, municipality, district, country, neighborhood, latitude, longitude, description, multimedia, features
    }
}
