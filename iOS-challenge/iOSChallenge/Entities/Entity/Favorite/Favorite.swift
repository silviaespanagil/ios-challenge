//
//  Favorite.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

import Foundation

struct Favorite: Identifiable {
    
    let id: String
    let isFavorite: Bool
    let dateAdded: Date
    
    static func from(_ favoriteProperty: FavoriteProperty) -> Favorite {
        
        Favorite(
            id: favoriteProperty.id ?? "",
            isFavorite: true,
            dateAdded: favoriteProperty.dateAdded ?? Date()
        )
    }
}
