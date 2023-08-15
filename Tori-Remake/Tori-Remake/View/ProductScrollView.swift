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

    var body: some View {
        ScrollView {
            Spacer()
            ForEach(viewModel.users) { user in
                if let addedProducts = user.addedProducts?.allObjects as? [CoreProduct], !addedProducts.isEmpty {
                    let sortedProducts = addedProducts.sorted { $0.postingDate! < $1.postingDate!}
                    ForEach(sortedProducts.filter { product in
                        (categoryStatus.isEmpty || product.category == categoryStatus) &&
                        (searchText.isEmpty || product.name?.localizedCaseInsensitiveContains(searchText) ?? false)
                    }) { product in
                        AdCardView(coreUser: user, coreProduct: product)
                            .padding(1)
                    }
                }
            }
        }
    }
}


//struct ProductScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductScrollView()
//    }
//}
