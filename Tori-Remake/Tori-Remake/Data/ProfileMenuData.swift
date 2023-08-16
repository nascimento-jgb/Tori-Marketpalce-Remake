//
//  ProfileMenuData.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 16.8.2023.
//

import Foundation

struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var menu: SelectedMenuItem
}

var menuItems = [
    MenuItem(text: "HOME", icon: "house", menu: .home),
    MenuItem(text: "FAVORITES", icon: "heart", menu: .favorites),
    MenuItem(text: "MESSAGES", icon: "bubble.left.and.bubble.right", menu: .messages),
    MenuItem(text: "ADD NEW PRODUCT", icon: "plus.circle", menu: .addNewProduct)
]

var menuItems2 = [
    MenuItem(text: "CONFIGURATION", icon: "gear", menu: .configuration),
    MenuItem(text: "SUPPORT", icon: "info.circle", menu: .support),
    MenuItem(text: "ANALYTICS", icon: "perspective", menu: .analytics)
]

var menuItems3 = [
    MenuItem(text: "Dark Mode", icon: "moon", menu: .home)
]

enum SelectedMenuItem: String {
    case home
    case favorites
    case messages
    case addNewProduct
    case analytics
    case configuration
    case support
    case darkmode
}
