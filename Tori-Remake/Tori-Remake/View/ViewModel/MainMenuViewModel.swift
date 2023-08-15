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
    
}





