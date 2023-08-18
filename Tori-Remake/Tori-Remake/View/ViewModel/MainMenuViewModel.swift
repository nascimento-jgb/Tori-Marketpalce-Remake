//
//  MainMenuViewModel.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 14.8.2023.
//

import Foundation
import Combine
import SwiftUI
import CoreData

class MainMenuViewModel: ObservableObject {
    
    @Published var users: [CoreUser] = []
    
    @Published var categoryStatus: String = ""
    @Published var searchText: String = ""

    @Published var selectedFilter: String = "Newest"
    @Published var selectedTypeOfSale: String = "For Sale"
    @Published var minProductValue: String = ""
    @Published var maxProductValue: String = ""
    @Published var locationSearchBar: String = ""
    
    private var cancellables: Set<AnyCancellable> = []
    private var hasFetchedData = false
    
    init() {
        fetchUsersIfNeeded()
    }
    
    func fetchUsersIfNeeded() {
        guard !hasFetchedData else { return }
        fetchUsers()
        hasFetchedData = true
    }
    
    func fetchUsers() {
        guard let fetchedUsers = CoreDataManager.shared.fetchAllUsers() else {
            return
        }
        users = fetchedUsers
    }
    
    func categorySelectionHeaderView(categoryStatus: Binding<String>) -> AnyView {
        if categoryStatus.wrappedValue != "" {
            return AnyView(
            HStack{
                Image(categoryImages[Category(rawValue: categoryStatus.wrappedValue)!]!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(.leading, 35)
                
                Spacer()
                Button(action: {
                    categoryStatus.wrappedValue = ""
                }) {
                    Text("reset")
                        .foregroundColor(.black)
                        .underline()
                        .padding(.trailing, 35)
                }
            }
            .frame(height: 55)
            )
        } else {
            return AnyView(EmptyView()) // Return an empty view if categoryStatus is empty
        }
    }
    
    //ProductScroll view methods
    func filteredProducts(viewModel: MainMenuViewModel) -> [CoreProduct] {
        let sortedProducts = getProducts(viewModel: viewModel).sorted(by: dynamicSort)
        
        return sortedProducts.filter { product in
            (categoryStatus.isEmpty || product.category == categoryStatus) &&
            (searchText.isEmpty || product.name?.localizedCaseInsensitiveContains(searchText) ?? false) &&
            (locationSearchBar.isEmpty || product.location?.localizedCaseInsensitiveContains(locationSearchBar) ?? false) &&
            (minProductValue.isEmpty || Int(product.price) > Int(minProductValue) ?? Int.min) &&
            (maxProductValue.isEmpty || Int(product.price) < Int(maxProductValue) ?? Int.max) &&
            (selectedTypeOfSale.isEmpty || product.typeOfSale == selectedTypeOfSale)
        }
    }
    
    func getProducts(viewModel: MainMenuViewModel) -> [CoreProduct] {
        var allProducts: [CoreProduct] = []
        
            for user in viewModel.users {
                if let addedProducts = user.addedProducts?.allObjects as? [CoreProduct] {
                    allProducts.append(contentsOf: addedProducts)
                }
            }
        return allProducts
    }
    
    func dynamicSort(_ item1: CoreProduct, _ item2: CoreProduct) -> Bool {
        switch selectedFilter {
        case "Newest":
            return item1.postingDate ?? Date() > item2.postingDate ?? Date()
        case "Oldest":
            return item1.postingDate ?? Date() < item2.postingDate ?? Date()
        case "Cheapest":
            return item1.price < item2.price
        case "Expensier":
            return item1.price > item2.price
        default:
            return item1.postingDate ?? Date() > item2.postingDate ?? Date()
        }
    }
    
    func user(for product: CoreProduct, viewModel: MainMenuViewModel) -> CoreUser? {
        for user in viewModel.users {
            if let addedProducts = user.addedProducts?.allObjects as? [CoreProduct], addedProducts.contains(product) {
                return user
            }
        }
        return nil
    }
}

