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
    @State private var categoryStatus = ""
    
    init(viewModel: MainMenuViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack{
                
                viewModel.categorySelectionHeaderView(categoryStatus: $categoryStatus)
                ScrollView
                {
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
                        CategoriesView(categoryStatus: $categoryStatus)
                            .padding(2)
                            .animation(.spring().delay(2), value: showMenu)
                    }
                }//VStack
            }//VStack
        }//ZStack
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        let context = CoreDataManager.shared.managedObjectContext
        let viewModel = MainMenuViewModel()
        
        return MainMenuView(viewModel: viewModel)
            .environment(\.managedObjectContext, context)
            .environmentObject(viewModel)
    }
}
