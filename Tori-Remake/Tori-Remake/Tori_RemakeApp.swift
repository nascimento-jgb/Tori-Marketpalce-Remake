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
        
        @State private var selectedFilterCategory: String = "Newest"
        @State private var selectedTypeOfSale: String = "For Sale"
        @State private var minProductValue: String = ""
        @State private var maxProductValue: String = ""
        @State private var locationSearchBar: String = ""
        
        var body: some Scene {
            WindowGroup {
                NavigationView{
                    MainMenuView(viewModel: viewModel,
                                 selectedFilterCategory: $selectedFilterCategory,
                                 selectedTypeOfSale: $selectedTypeOfSale,
                                 minProductValue: $minProductValue,
                                 maxProductValue: $maxProductValue,
                                 locationSearchBar: $locationSearchBar
                             )
                        .onAppear {
                            CoreDataManager.shared.transferDataFromUserData()
                        }
                }
            }
        }
    }
