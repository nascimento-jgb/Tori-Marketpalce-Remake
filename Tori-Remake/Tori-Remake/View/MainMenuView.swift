//
//  MainMenuView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import SwiftUI

struct MainMenuView: View {
    
    @State private var showMenu = false
    @State private var searchText = ""

    var body: some View {
        ZStack {
            VStack {
                ScrollView
                {
                    Spacer()
                    
                    AdView()
                        .padding(1)
                    AdView()
                        .padding(1)
                    AdView()
                        .padding(1)
                    AdView()
                        .padding(1)
                    AdView()
                        .padding(1)
                }
                
                VStack {
//                    Spacer()
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
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.gray)
                            .padding(.leading, 2)
                        
                        TextField("Search for a Item", text: $searchText)
                            .padding(.vertical, 12)
                            .padding(.leading, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .shadow(radius: 3)
                            )
                            .padding(.horizontal, 8)
                        
                        Image(systemName: "person")
                            .foregroundColor(.red)
                            .padding(.trailing, 2)
                    }
                    .padding()
                    
                    if showMenu {
                            CategoriesView()
                            .padding(2)
                        }
                }//VStack
            }//ZStack
        }
    }
}


struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}