//
//  ProductScrollView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 15.8.2023.
//

import SwiftUI

struct ProductsScrollView: View {
    
    @ObservedObject var viewModel: MainMenuViewModel
    
    var body: some View {
        ScrollView {
            
            Spacer()
            
            ForEach(viewModel.filteredProducts(viewModel: viewModel)) { product in
                if let productOwner = viewModel.user(for: product, viewModel: viewModel) {
                        AdCardView(coreUser: productOwner, coreProduct: product)
                            .padding(1)
                            .onAppear(){
                                viewModel.updateProductCount(viewModel: viewModel)
                            }
                    }
                }
            }
        }
}
