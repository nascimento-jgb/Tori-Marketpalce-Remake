//
//  Tori_RemakeApp.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 12.8.2023.
//

    import SwiftUI

    @main
    struct Tori_RemakeApp: App {
        let context = CoreDataManager.shared.managedObjectContext
        let viewModel = MainMenuViewModel()
        
        @State private var selectedFilter: String = "Newest"
        @State private var selectedTypeOfSale: String = "For Sale"
        @State private var minProductValue: String = ""
        @State private var maxProductValue: String = ""
        @State private var locationSearchBar: String = ""
        @State private var categoryStatus = ""
        
        var body: some Scene {
            WindowGroup {
                NavigationView{
                    MainMenuView(viewModel: viewModel,
                                 selectedFilter: $selectedFilter,
                                 selectedTypeOfSale: $selectedTypeOfSale,
                                 minProductValue: $minProductValue,
                                 maxProductValue: $maxProductValue,
                                 locationSearchBar: $locationSearchBar,
                                 categoryStatus: $categoryStatus
                             )
                        .onAppear {
                            CoreDataManager.shared.transferDataFromUserData()
                        }
                }
            }
        }
    }
