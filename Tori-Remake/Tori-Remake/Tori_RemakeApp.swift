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
        
        var body: some Scene {
            WindowGroup {
                NavigationView{
                    MainMenuView(viewModel: viewModel)
                        .onAppear {
                            CoreDataManager.shared.transferDataFromUserData()
                        }
                }
            }
        }
    }
