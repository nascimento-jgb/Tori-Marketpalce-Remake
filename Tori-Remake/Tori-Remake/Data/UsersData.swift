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
                 accountCreationDate: Date(),
                 listOfAdds: [
                    Product(id: UUID(),
                            name: "iPhone 13",
                            price: 799.99,
                            imageUrl: "Shirt",
                            location: "Helsinki",
                            postingDate: Date(),
                            category: "Electronics",
                            info: "Latest iPhone model",
                            typeOfSale: "For Sale",
                            size: nil),
                 ],
                 listOfFavorites: [],
                 listOfMessages: [])

let user2 = User(id: UUID(),
                 name: "Jane Smith",
                 accountCreationDate: Date(),
                 listOfAdds: [
                    Product(id: UUID(),
                            name: "Mountain Bike",
                            price: 499.99,
                            imageUrl: "Shirt",
                            location: "Tampere",
                            postingDate: Date(),
                            category: "Hobbies",
                            info: "High-quality mountain bike",
                            typeOfSale: "For Sale",
                            size: nil),
                    Product(id: UUID(),
                            name: "Cozy Sofa",
                            price: 799.99,
                            imageUrl: "Shirt",
                            location: "Turku",
                            postingDate: Date(),
                            category: "Living",
                            info: "Comfortable sofa for your home",
                            typeOfSale: "For Sale",
                            size: nil),
                    Product(id: UUID(),
                            name: "Classic T-Shirt",
                            price: 29.99,
                            imageUrl: "Shirt",
                            location: "Vantaa",
                            postingDate: Date(),
                            category: "Clothing",
                            info: "Soft cotton t-shirt",
                            typeOfSale: "For Sale",
                            size: "M"),
                 ],
                 listOfFavorites: [],
                 listOfMessages: [])
