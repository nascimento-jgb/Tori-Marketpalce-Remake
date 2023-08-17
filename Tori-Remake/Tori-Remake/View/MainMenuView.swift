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
    
    @Binding private var selectedFilter: String
    @Binding private var selectedTypeOfSale: String
    @Binding private var minProductValue: String
    @Binding private var maxProductValue: String
    @Binding private var locationSearchBar: String
    @Binding private var categoryStatus: String
    
    @State private var showMenu = false
    @State private var searchText = ""
    @State private var isProfileOpen = false
    @State private var isCategoryFiltersOpen = false
    
    init(
            viewModel: MainMenuViewModel,
            selectedFilter: Binding<String>,
            selectedTypeOfSale: Binding<String>,
            minProductValue: Binding<String>,
            maxProductValue: Binding<String>,
            locationSearchBar: Binding<String>,
            categoryStatus: Binding<String>
        ) {
            self.viewModel = viewModel
            _selectedFilter = selectedFilter
            _selectedTypeOfSale = selectedTypeOfSale
            _minProductValue = minProductValue
            _maxProductValue = maxProductValue
            _locationSearchBar = locationSearchBar
            _categoryStatus = categoryStatus
        }
    
    
 var body: some View {
        
        ZStack {
                if isProfileOpen {
                    Constants.Colors.primaryColor.ignoresSafeArea().opacity(0.1)
                    ProfileSideMenu()
                }
            
                if isCategoryFiltersOpen{
                    Constants.Colors.primaryColor.ignoresSafeArea().opacity(0.1)
                    FiltersSideMenu(selectedFilter: $selectedFilter, selectedTypeOfSale: $selectedTypeOfSale, minProductValue: $minProductValue, maxProductValue: $maxProductValue, locationSearchBar: $locationSearchBar, categoryStatus: $categoryStatus)
                }
            
            ZStack {
                
                VStack{
                    viewModel.categorySelectionHeaderView(categoryStatus: $categoryStatus)
                    
                    viewModel.createProductsScrollView(categoryStatus: $categoryStatus, searchText: $searchText, selectedFilter: $selectedFilter, selectedTypeOfSale: $selectedTypeOfSale, minProductValue: $minProductValue, maxProductValue: $maxProductValue, locationSearchBar: $locationSearchBar)
                        
                    VStack {
                        Image(systemName: "chevron.compact.up")
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                            .padding(1)
                            .onTapGesture {
                                withAnimation {
                                    self.showMenu.toggle()
                                }
                            }
                        
                        HStack {
                            Image(systemName: "list.bullet.indent")
                                .foregroundColor(showMenu ? Constants.Colors.primaryColor : .black)
                                .padding(.leading, 2)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                        isCategoryFiltersOpen.toggle()
                                    }
                                }
                            
                            TextField("Search for an Item", text: $searchText)
                                .customFont(.body)
                                .padding(.vertical, 12)
                                .padding(.leading, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white)
                                        .shadow(radius: 3)
                                )
                                .padding(.horizontal, 8)
                                
                            
                            Image(systemName: "person")
                                .foregroundColor(showMenu ? .black : Constants.Colors.primaryColor)
                                .padding(.trailing, 2)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                        isProfileOpen.toggle()
                                    }
                                }
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
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .rotation3DEffect(.degrees(isProfileOpen ? 30 : 0), axis: (x: 0, y: 1, z: 0))
            .offset(x: isProfileOpen ? -245 : 0)
            .scaleEffect(isProfileOpen ? 0.9 : 1)
            .ignoresSafeArea(.all, edges: isProfileOpen ? .all : .init())
            //Same checks but for the other button
            .rotation3DEffect(.degrees(isCategoryFiltersOpen ? -30 : 0), axis: (x: 0, y: 1, z: 0))
            .offset(x: isCategoryFiltersOpen ? 245 : 0)
            .scaleEffect(isCategoryFiltersOpen  ? 0.9 : 1)
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        let context = CoreDataManager.shared.managedObjectContext
        let viewModel = MainMenuViewModel()
        
        return MainMenuView(viewModel: viewModel,
                            selectedFilter: .constant("Category"),
                            selectedTypeOfSale: .constant("Sale"),
                            minProductValue: .constant("0"),
                            maxProductValue: .constant("100"),
                            locationSearchBar: .constant("Location"),
                            categoryStatus: .constant("None")
                            )
            .environment(\.managedObjectContext, context)
            .environmentObject(viewModel)
    }
}
