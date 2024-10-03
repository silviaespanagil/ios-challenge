//
//  ServerProperty.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Foundation

struct ServerProperty: Codable, Identifiable {
    
    let id: String
    let thumbnail: String
    let floor: String
    let price: Double
    let priceInfo: ServerPriceInfo
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
    let multimedia: ServerMultimedia
    let features: [String: Bool]
    
    enum CodingKeys: String, CodingKey {
        
        case id = "propertyCode"
        case thumbnail, floor, price, priceInfo, propertyType, operation, size, exterior, rooms, bathrooms, address, province, municipality, district, country, neighborhood, latitude, longitude, description, multimedia, features
    }
    
    func convertToEntity() -> Property {
        
        return Property(id: id, thumbnail: thumbnail, floor: floor, price: price, priceInfo: priceInfo.convertToEntity(), propertyType: propertyType, operation: operation, size: size, exterior: exterior, rooms: rooms, bathrooms: bathrooms, address: address, province: province, municipality: municipality, district: district, country: country, neighborhood: neighborhood, latitude: latitude, longitude: longitude, description: description, multimedia: multimedia.convertToEntity(), features: features)
    }
}
