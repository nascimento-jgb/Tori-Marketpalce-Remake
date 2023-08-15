//
//  UsersData.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 14.8.2023.
//

import Foundation

import Foundation

class UserData : ObservableObject {
    static let shared = UserData() // Singleton instance
    
    @Published var users: [User]
    
    private init() {
        users = [user1, user2]
    }
}

let user1 = User(id: UUID(),
                 name: "John Doe",
                 accountCreationDate: randomDate(),
                 listOfAdds: [
                    Product(id: UUID(),
                            name: "iPhone 13",
                            price: 799.99,
                            imageUrl: "Shirt",
                            location: "Helsinki",
                            postingDate: randomDate(),
                            category: "Electronics",
                            info: "Latest iPhone model",
                            typeOfSale: "For Sale",
                            size: "No Size"),
                 ],
                 listOfFavorites: [])

let user2 = User(id: UUID(),
                 name: "Jane Smith",
                 accountCreationDate: randomDate(),
                 listOfAdds: [
                    Product(id: UUID(),
                            name: "Mountain Bike",
                            price: 499.99,
                            imageUrl: "Shirt",
                            location: "Tampere",
                            postingDate: randomDate(),
                            category: "Leisure and Hobbies",
                            info: "High-quality mountain bike",
                            typeOfSale: "For Sale",
                            size: "No Size"),
                    Product(id: UUID(),
                            name: "Cozy Sofa",
                            price: 799.99,
                            imageUrl: "Shirt",
                            location: "Turku",
                            postingDate: randomDate(),
                            category: "Home and Living",
                            info: "Comfortable sofa for your home",
                            typeOfSale: "For Sale",
                            size: "No Size"),
                    Product(id: UUID(),
                            name: "Classic T-Shirt",
                            price: 29.99,
                            imageUrl: "Shirt",
                            location: "Vantaa",
                            postingDate: randomDate(),
                            category: "Other",
                            info: "Soft cotton t-shirt",
                            typeOfSale: "For Sale",
                            size: "M"),
                 ],
                 listOfFavorites: [])

func randomDate() -> Date {
    let currentDate = Date()
    
    let randomTimeInterval = TimeInterval(arc4random_uniform(UInt32(365 * 24 * 60 * 60))) // Random interval within a year (in seconds)
    return currentDate.addingTimeInterval(randomTimeInterval)
}
