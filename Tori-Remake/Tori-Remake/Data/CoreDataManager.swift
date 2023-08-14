//
//  CoreDataManager.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 14.8.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Tori_Remake")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                fatalError("Unable to save managed object context: \(error)")
            }
        }
    }
    
    func transferDataFromUserData() {
        let manager = CoreDataManager.shared
        let context = manager.managedObjectContext
            
        // Loop through users in UserData.shared and create User entities in Core Data
        for user in UserData.shared.users {
            let coreUser = CoreUser(context: context)
            coreUser.id = user.id
            coreUser.name = user.name
            coreUser.accountCreationDate = user.accountCreationDate
            coreUser.listOfMessages = user.listOfMessages as NSArray
            
                
        // Loop through user's listOfAdds and create Product entities in Core Data
        for product in user.listOfAdds {
            let coreProduct = CoreProduct(context: context)
            coreProduct.id = product.id
            coreProduct.name = product.name
            coreProduct.price = product.price
            coreProduct.imageUrl = product.imageUrl
            coreProduct.location = product.location
            coreProduct.postingDate = product.postingDate
            coreProduct.category = product.category
            coreProduct.info = product.info
            coreProduct.typeOfSale = product.typeOfSale
            coreProduct.size = product.size
                    
            coreUser.addToAdds(coreProduct)
            }
            
        for product in user.listOfFavorites {
            let coreProduct = CoreProduct(context: context)
            coreProduct.id = product.id
            coreProduct.name = product.name
            coreProduct.price = product.price
            coreProduct.imageUrl = product.imageUrl
            coreProduct.location = product.location
            coreProduct.postingDate = product.postingDate
            coreProduct.category = product.category
            coreProduct.info = product.info
            coreProduct.typeOfSale = product.typeOfSale
            coreProduct.size = product.size
            
            coreUser.addToFavorites(coreProduct)
            }
                
            // Save the managed object context
            manager.saveContext()
        }
    }
}
