//
//  ProductScrollView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 15.8.2023.
//

import SwiftUI

struct ProductsScrollView: View {
    
    @ObservedObject var viewModel: MainMenuViewModel

//    @Binding var categoryStatus: String
//    @Binding var searchText: String
//
//    @Binding var selectedFilter: String
//    @Binding var selectedTypeOfSale: String
//    @Binding var minProductValue: String
//    @Binding var maxProductValue: String
//    @Binding var locationSearchBar: String
    
    var body: some View {
        ScrollView {
            Spacer()
            ForEach(viewModel.filteredProducts(viewModel: viewModel)) { product in
                if let productOwner = viewModel.user(for: product, viewModel: viewModel) {
                        AdCardView(coreUser: productOwner, coreProduct: product)
                            .padding(1)
                    }
                }
            }
        }
    
   
}
