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
    
    // MARK: - Core Data Stack
    
    // Persistent container that represents the Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Tori_Remake")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    // Managed object context associated with the persistentContainer's viewContext
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    // Saves changes made in the managed object context
    func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                fatalError("Unable to save managed object context: \(error)")
            }
        }
    }
    
    // MARK: - Data Transfer
    
    //Using batchDelete to clear CoreUser objects more efficiently
    func clearUserData(in context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = CoreUser.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try managedObjectContext.execute(batchDeleteRequest)
        } catch {
            print("Error clearing existing data: \(error)")
        }
    }

    // Transfers data from a UserData instance to Core Data in the background contex// Transfers data from a UserData instance to Core Data in the background context
    func transferDataFromUserData() {
        persistentContainer.performBackgroundTask { backgroundContext in
            // Clear existing user data in the background context
            self.clearUserData(in: backgroundContext)

            // Loop through users in UserData.shared and create User entities in Core Data
            for user in UserData.shared.users {
                let coreUser = CoreUser(context: backgroundContext)
                coreUser.id = user.id
                coreUser.name = user.name
                coreUser.email = user.email
                coreUser.password = user.password
                coreUser.accountCreationDate = user.accountCreationDate
 
                // Loop through user's listOfAdds and create Product entities in Core Data
                for product in user.listOfAdds {
                    let coreProduct = CoreProduct(context: backgroundContext)
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

                // Loop through user's listOfFavorites and create Product entities in Core Data
                for product in user.listOfFavorites {
                    let coreProduct = CoreProduct(context: backgroundContext)
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
            }

            // Save the background context
            do {
                try backgroundContext.save()
            } catch {
                print("Error saving background context: \(error)")
            }

            // Save the main context
            self.saveContext()
        }
    }

    // Fetches a user with the specified email and password from Core Data
    // Returns true if a matching user is found, false otherwise
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
    
    // Fetches all users from Core Data with their added products and favorites pre-fetched
    // Returns an array of CoreUser objects or nil if an error occurs
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
