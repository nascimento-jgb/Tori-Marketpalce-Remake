//
//  MainMenuView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import SwiftUI
import CoreData

struct MainMenuView: View {
    
    @ObservedObject private var viewModel: MainMenuViewModel
    
    @State private var showMenu = false
    @State private var searchText = ""
    
    init(viewModel: MainMenuViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack{
                
                ScrollView
                {
                    Spacer()
                    ForEach(viewModel.users) { user in
                        if let addedProducts = user.addedProducts?.allObjects as? [CoreProduct], !addedProducts.isEmpty {
                            ForEach(addedProducts) { product in
                                AdCardView(coreUser: user, coreProduct: product)
                                    .padding(1)
                            }
                        }
                    }
                }
                
                VStack {
                    Image(systemName: "chevron.compact.up")
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                        .padding(1)
                        .onTapGesture {
                            withAnimation {
                                self.showMenu.toggle()
                            }
                        }
                    
                    HStack {
                        Image(systemName: "list.bullet.indent")
                            .foregroundColor(.gray)
                            .padding(.leading, 2)
                        
                        TextField("Search for an Item", text: $searchText)
                            .padding(.vertical, 12)
                            .padding(.leading, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .shadow(radius: 3)
                            )
                            .padding(.horizontal, 8)
                        
                        Image(systemName: "person")
                            .foregroundColor(Constants.Colors.primaryColor)
                            .padding(.trailing, 2)
                    }
                    .padding()
                    
                    if showMenu {
                        CategoriesView()
                            .padding(2)
                            .animation(.spring().delay(2), value: showMenu)
                    }
                }//VStack
            }//VStack
        }//ZStack
    }
}
//    func userDetailsText(user: CoreUser) -> String {
//        var text = "User Name: \(user.name ?? "Unknown User")\n"
//
//        if let addedProducts = user.addedProducts?.allObjects as? [CoreProduct], !addedProducts.isEmpty {
//            text += "Added Products:\n"
//            for product in addedProducts {
//                text += "- \(product.name ?? "Unknown Product")\n"
//                text += "- \(product.price)\n"
//                text += "- \(product.info ?? "Unknown Product")\n"
//                text += "- \(product.location ?? "Unknown Product")\n"
//                text += "- \(product.typeOfSale ?? "Unknown Product")\n"
//            }
//        }
//
//        if let addedFavorites = user.addedFavorites?.allObjects as? [CoreProduct], !addedFavorites.isEmpty {
//            text += "Added Favorites:\n"
//            for favorite in addedFavorites {
//                text += "- \(favorite.name ?? "Unknown Favorite")\n"
//            }
//        }
//
//        return text
//    }


struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        let context = CoreDataManager.shared.managedObjectContext
        let viewModel = MainMenuViewModel()
        
        return MainMenuView(viewModel: viewModel)
            .environment(\.managedObjectContext, context)
            .environmentObject(viewModel)
    }
}





