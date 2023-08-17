//
//  UserProfile.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 14.8.2023.
//

import Foundation

struct User: Encodable, Identifiable {
    let id: UUID
    let name: String
    let email: String
    let password: String
    let accountCreationDate: Date
    let listOfAdds: [Product]
    let listOfFavorites: [Product]
}

struct Product: Encodable, Identifiable {
    
    let id: UUID
    let name: String
    let price: Float
    let imageUrl: String
    let location: String
    let postingDate: Date
    let category: String
    let info: String
    let typeOfSale: String
    let size: String
}
