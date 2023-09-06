//
//  MainMenuView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import SwiftUI
import CoreData

struct MainMenuView: View {
    
    @ObservedObject var viewModel: MainMenuViewModel
    @State private var showMenu = false
    @State private var isProfileOpen = false
    @State private var isCategoryFiltersOpen = false
    
 var body: some View {
        
        ZStack {
                if isProfileOpen {
                    Constants.Colors.primaryColor.ignoresSafeArea().opacity(0.1)
                    ProfileSideMenu()
                }
            
                if isCategoryFiltersOpen {
                    Constants.Colors.primaryColor.ignoresSafeArea().opacity(0.1)
                    FiltersSideMenu(viewModel: viewModel)
                }
            
            ZStack {
                VStack{
                    viewModel.categorySelectionHeaderView(categoryStatus: $viewModel.categoryStatus)
                    
                    ProductsScrollView(viewModel: viewModel)
                        .onChange(of: viewModel.selectedFilter) { _ in
                                 viewModel.updateProductCount(viewModel: viewModel)
                             }
                    
                    SearchBarView(viewModel: viewModel, showMenu: $showMenu, isCategoryFiltersOpen: $isCategoryFiltersOpen, isProfileOpen: $isProfileOpen)
                }
            }
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
        
        return MainMenuView(viewModel: viewModel)
            .environment(\.managedObjectContext, context)
            .environmentObject(viewModel)
    }
}
