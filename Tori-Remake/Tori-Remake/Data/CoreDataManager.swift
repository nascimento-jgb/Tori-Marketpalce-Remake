//
//  CoreDataManager.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 14.8.2023.
//

import Foundation
import CoreData

final class CoreDataManager : ObservableObject {
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
    
    func clearUserData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = CoreUser.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try managedObjectContext.execute(batchDeleteRequest)
        } catch {
            print("Error clearing existing data: \(error)")
        }
    }
    
    func transferDataFromUserData() {
        let manager = CoreDataManager.shared
        let context = manager.managedObjectContext
        
        clearUserData()
            
        // Loop through users in UserData.shared and create User entities in Core Data
        for user in UserData.shared.users {
            let coreUser = CoreUser(context: context)
            coreUser.id = user.id
            coreUser.name = user.name
            coreUser.email = user.email
            coreUser.password = user.password
            coreUser.accountCreationDate = user.accountCreationDate
                
        // Loop through user's listOfAdds and create Product entities in Core Data
            for product in user.listOfAdds {
            let coreProduct = CoreProduct(context: context)
            coreProduct.id = product.id
            coreProduct.name = product.name
            coreProduct.price = product.price
            coreProduct.imageInfo = product.imageUrl
            coreProduct.location = product.location
            coreProduct.postingDate = product.postingDate
            coreProduct.category = product.category
            coreProduct.info = product.info
            coreProduct.typeOfSale = product.typeOfSale
            coreProduct.size = product.size
                    
            coreUser.addToAddedProducts(coreProduct)
            }
            
        for product in user.listOfFavorites {
            let coreProduct = CoreProduct(context: context)
            coreProduct.id = product.id
            coreProduct.name = product.name
            coreProduct.price = product.price
            coreProduct.imageInfo = product.imageUrl
            coreProduct.location = product.location
            coreProduct.postingDate = product.postingDate
            coreProduct.category = product.category
            coreProduct.info = product.info
            coreProduct.typeOfSale = product.typeOfSale
            coreProduct.size = product.size
            
            coreUser.addToAddedFavorites(coreProduct)
            }
            // Save the managed object context
            manager.saveContext()
        }
    }
    
    func fetchUser(withEmail email: String, password: String) -> Bool {
        let fetchRequest: NSFetchRequest<CoreUser> = CoreUser.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)
        
        do {
            let fetchedUsers = try managedObjectContext.fetch(fetchRequest)
            return !fetchedUsers.isEmpty
        } catch {
            print("Error fetching user: \(error)")
            return false
        }
    }
    
    func fetchAllUsers() -> [CoreUser]? {
        let fetchRequest: NSFetchRequest<CoreUser> = CoreUser.fetchRequest()
        fetchRequest.relationshipKeyPathsForPrefetching = ["addedProducts", "addedFavorites"]

        do {
            let fetchedUsers = try managedObjectContext.fetch(fetchRequest)
            return fetchedUsers
        } catch {
            print("Error fetching all users: \(error)")
            return nil
        }
    }
    
}
