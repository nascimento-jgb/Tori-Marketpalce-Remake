//
//  SearchBarView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 6.9.2023.
//

import SwiftUI

struct SearchBarView: View {
    
    @ObservedObject var viewModel : MainMenuViewModel
    @Binding var showMenu: Bool
    @Binding var isCategoryFiltersOpen: Bool
    @Binding var isProfileOpen : Bool
    
    var body: some View {
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
                
                TextField("Search for an Item", text: $viewModel.searchText)
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
                CategoriesView(viewModel: viewModel)
                    .padding(2)
                    .animation(.spring().delay(2), value: showMenu)
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainMenuViewModel()
        
        SearchBarView(viewModel: viewModel, showMenu: .constant(true), isCategoryFiltersOpen: .constant(true), isProfileOpen: .constant(true))
    }
}
