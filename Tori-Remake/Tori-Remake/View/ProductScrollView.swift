//
//  ProductScrollView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 15.8.2023.
//

import SwiftUI

struct ProductsScrollView: View {
    @ObservedObject var viewModel: MainMenuViewModel

    @Binding var categoryStatus: String
    @Binding var searchText: String

    @Binding var selectedFilterCategory: String
    @Binding var selectedTypeOfSale: String
    @Binding var minProductValue: String
    @Binding var maxProductValue: String
    @Binding var locationSearchBar: String
    
    var body: some View {
        ScrollView {

            Spacer()
        
            let sortedProducts = getProducts().sorted(by: dynamicSort)
            
            ForEach(sortedProducts.filter { product in
                (categoryStatus.isEmpty || product.category == categoryStatus) &&
                (searchText.isEmpty || product.name?.localizedCaseInsensitiveContains(searchText) ?? false) &&
                (locationSearchBar.isEmpty || product.location?.localizedCaseInsensitiveContains(locationSearchBar) ?? false) &&
                (minProductValue.isEmpty || Int(product.price) > Int(minProductValue) ?? Int.min) &&
                (maxProductValue.isEmpty || Int(product.price) < Int(maxProductValue) ?? Int.max) &&
                (selectedTypeOfSale.isEmpty || product.typeOfSale == selectedTypeOfSale)
            }) { product in
                if let productOwner = user(for: product) {
                        AdCardView(coreUser: productOwner, coreProduct: product)
                            .padding(1)
                    }

            }

        }
    }
    
    private func dynamicSort(_ item1: CoreProduct, _ item2: CoreProduct) -> Bool {
        switch selectedFilterCategory {
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
    
    private func user(for product: CoreProduct) -> CoreUser? {
        for user in viewModel.users {
            if let addedProducts = user.addedProducts?.allObjects as? [CoreProduct], addedProducts.contains(product) {
                return user
            }
        }
        return nil
    }
    
    private func getProducts() -> [CoreProduct] {
        
        var allProducts: [CoreProduct] = []
        
            for user in viewModel.users {
                if let addedProducts = user.addedProducts?.allObjects as? [CoreProduct] {
                    allProducts.append(contentsOf: addedProducts)
                }
            }
            return allProducts
        }
}
