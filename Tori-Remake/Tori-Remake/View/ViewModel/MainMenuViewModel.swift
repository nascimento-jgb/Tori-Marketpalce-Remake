//
//  MainMenuViewModel.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 14.8.2023.
//

import Foundation
import Combine
import SwiftUI

class MainMenuViewModel: ObservableObject {
    
    @Published var users: [CoreUser] = []
    private var cancellables: Set<AnyCancellable> = []
    private var hasFetchedData = false
    
    init() {
        fetchUsersIfNeeded()
    }
    
    func fetchUsersIfNeeded() {
        guard !hasFetchedData else { return }
        fetchUsers()
        hasFetchedData = true
    }
    
    func fetchUsers() {
        guard let fetchedUsers = CoreDataManager.shared.fetchAllUsers() else {
            return
        }
        users = fetchedUsers
    }
    
    func categorySelectionHeaderView(categoryStatus: Binding<String>) -> AnyView {
        if categoryStatus.wrappedValue != "" {
            return AnyView(
            HStack{
                Image(categoryImages[Category(rawValue: categoryStatus.wrappedValue)!]!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(.leading, 35)
                
                Spacer()
                Button(action: {
                    categoryStatus.wrappedValue = ""
                }) {
                    Text("reset")
                        .foregroundColor(.black)
                        .underline()
                        .padding(.trailing, 35)
                }
            }
            .frame(height: 55)
            )
        } else {
            return AnyView(EmptyView()) // Return an empty view if categoryStatus is empty
        }
    }

    func createProductsScrollView(categoryStatus: Binding<String>, searchText: Binding<String>) -> some View {
        ProductsScrollView(viewModel: self, categoryStatus: categoryStatus, searchText: searchText)
    }

}





