//
//  Category.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import Foundation

enum Category: String, CaseIterable {
    case Electronics = "Electronics"
    case Vehicles = "Vehicles"
    case Living = "Home & Living"
    case Hobbies = "Leisure & Hobbies"
    case Property = "Property & Rental"
    case Services = "Services & Business"
    case Other = "Other"
}

let categoryArray: [Category] = [
    .Electronics,
    .Vehicles,
    .Living,
    .Hobbies,
    .Property,
    .Services,
    .Other
]

let categoryImages: [Category: String] = [
    .Electronics: "electronics",
    .Vehicles: "vehicle",
    .Living: "home",
    .Hobbies: "hobbies",
    .Property: "rental",
    .Services: "services",
    .Other: "other"
]
