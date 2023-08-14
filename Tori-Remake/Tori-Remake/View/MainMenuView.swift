//
//  MainMenuView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import SwiftUI

struct MainMenuView: View {
    
    @EnvironmentObject var userData: UserData
    
    @State private var showMenu = false
    @State private var searchText = ""

    var body: some View {
        ZStack {
            VStack {
                ScrollView
                {
                    Spacer()
                    
                    ForEach(userData.users) { user in
                        ForEach(user.listOfAdds) { product in
                            AdCardView(user: user, product: product)
                                .padding(1)
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
            }//ZStack
            .onAppear {
                printUsersName()
            }
        }
    }
    
    func printUsersName() {
            for user in userData.users {
                print("DATA: \(user.name)")
            }
        }
}


struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
            .environmentObject(UserData.shared)
    }
}


