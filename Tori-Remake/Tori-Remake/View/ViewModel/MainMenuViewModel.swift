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

final class MainMenuViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published var users: [CoreUser] = []
    @Published var categoryStatus: String = ""
    @Published var searchText: String = ""
    @Published var selectedFilter: String = "Newest"
    @Published var selectedTypeOfSale: String = "For Sale"
    @Published var minProductValue: String = ""
    @Published var maxProductValue: String = ""
    @Published var locationSearchBar: String = ""
    @Published var displayedProductCount: Int = 0
    
    // MARK: - Private Properties
    
    private var hasFetchedData = false
    
    // MARK: - Initialization
    
    init() {
        fetchUsersIfNeeded()
    }
    
    // MARK: - User Data Methods
    
    // Fetches users from Core Data if the users array is empty.
    func fetchUsersIfNeeded() {
        guard users.isEmpty else { return }
        fetchData()
    }
    
    // Fetches all users from Core Data and updates the users array.
    func fetchData() {
        guard let fetchedUsers = CoreDataManager.shared.fetchAllUsers() else {
            return
        }
        users = fetchedUsers
    }
    
    // MARK: - Validation Methods
    
    // Validates if an email is in a valid format.
    func isValidEmail(email: String) -> Bool {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailPredicate.evaluate(with: email)
    }
    
    // MARK: - Login Method
    
    // Logs in a user with the provided email and password.
    func loginUser(email: String, password: String) -> Bool {
        if !email.isEmpty && !password.isEmpty {
            if isValidEmail(email: email.lowercased()) {
                let userExists = CoreDataManager.shared.fetchUser(withEmail: email, password: password)
                if userExists {
                    UserDefaults.standard.set(email, forKey: kEmail)
                    UserDefaults.standard.set(password, forKey: kPassword)
                    UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                    return true
                }
            }
        }
        return false
    }
    
    // MARK: - User Methods
    
    // Retrieves the user who added the given product.
    func getUser(for product: CoreProduct, viewModel: MainMenuViewModel) -> CoreUser? {
        for user in viewModel.users {
            if let addedProducts = user.addedProducts?.allObjects as? [CoreProduct], addedProducts.contains(product) {
                return user
            }
        }
        return nil
    }
    
    // MARK: - Product Methods
    
    // Filters the products based on the selected criteria.
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
    
    // Performs dynamic sorting of products based on the selected filter.
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
    
    // Retrieves all products added by users.
    func getProducts(viewModel: MainMenuViewModel) -> [CoreProduct] {
        var allProducts: [CoreProduct] = []
        
        for user in viewModel.users {
            if let addedProducts = user.addedProducts?.allObjects as? [CoreProduct] {
                allProducts.append(contentsOf: addedProducts)
            }
        }
        return allProducts
    }
    
    // MARK: - View Methods
    
    // Creates a view for the category selection header based on the current category status.
    // - Parameter categoryStatus: A binding to the current category status.
    // - Returns: A view displaying the selected category image and a reset button, or an empty view if the category status is empty.
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
    
    // MARK: - Helper Methods
    
    //Help to update the product counter at side filter menu
    func updateProductCount(viewModel: MainMenuViewModel) {
        displayedProductCount = viewModel.filteredProducts(viewModel: viewModel).count
    }
}
