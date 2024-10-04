//
//  FavoritesManager.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

import CoreData
import UIKit

class FavoritesManager {
    
    static let shared = FavoritesManager()
    
    internal var container: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        
        container.viewContext
    }
    
    internal init() {
        
        container = NSPersistentContainer(name: "FavoriteProperty")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data: \(error)")
            }
        }
    }
    
    func toggleFavorite(_ property: Property) -> Favorite {
        
        if isFavorite(property) {
            
            removeFavorite(property)
            return Favorite(id: property.id, isFavorite: false, dateAdded: Date())
            
        } else {
            
            return addFavorite(property)
        }
    }
    
    func getFavorite(_ property: Property) -> Favorite {
        
        let fetchRequest: NSFetchRequest<FavoriteProperty> = FavoriteProperty.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", property.id)
        
        do {
            if let favoriteProperty = try context.fetch(fetchRequest).first {
                
                return Favorite.from(favoriteProperty)
            }
            
            return Favorite(id: property.id, isFavorite: false, dateAdded: Date())
        } catch {
            
            print("Error fetching favorite: \(error)")
            
            return Favorite(id: property.id, isFavorite: false, dateAdded: Date())
        }
    }
}

extension FavoritesManager {
    
    // MARK: Private methods
    
    internal func addFavorite(_ property: Property) -> Favorite {
        
        let favorite = FavoriteProperty(context: context)
        
        favorite.id = property.id
        favorite.dateAdded = Date()
        
        saveContext()
        
        return Favorite.from(favorite)
    }
    
    internal func removeFavorite(_ property: Property) {
        
        let fetchRequest: NSFetchRequest<FavoriteProperty> = FavoriteProperty.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", property.id)
        
        do {
            
            let results = try context.fetch(fetchRequest)
            results.forEach { context.delete($0) }
            
            saveContext()
        } catch {
            
            print("Error removing favorite: \(error)")
        }
    }
    
    internal func isFavorite(_ property: Property) -> Bool {
        
        let fetchRequest: NSFetchRequest<FavoriteProperty> = FavoriteProperty.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", property.id)
        
        do {
            
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch {
            
            print("Error checking favorite status: \(error)")
            return false
        }
    }
    
    internal func saveContext() {
        
        if context.hasChanges {
            
            do {
                
                try context.save()
            } catch {
                
                print("Error saving context: \(error)")
            }
        }
    }
}
