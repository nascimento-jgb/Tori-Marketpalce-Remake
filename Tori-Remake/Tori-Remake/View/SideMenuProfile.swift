//
//  SideMenuProfile.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 15.8.2023.
//

import SwiftUI

struct SideMenuProfile: View {
    
    @State var selectedMenu: SelectedMenuItem = .home
    @State var isDarkMode = false
    var body: some View {
        VStack{
        
            HStack{
                Spacer()
                Image(systemName: "person")
                    .padding(12)
                    .background(.white.opacity(0.2))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 2) {
                    Text("Joao Nascimento")
                    //            .customFont()
                    Text("Partners since 2021")
                        .opacity(0.7)
                    //            .customFont()
                }
                Spacer()
            }
            .padding()
            .padding(.leading, -45)
            
            Text("BROWSE")
//               .customFont
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 32)
                .padding(.top, 25)
            
            VStack(alignment: .leading, spacing: 0){
                ForEach(menuItems) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    MenuRowProfile(item: item, selectedMenu: $selectedMenu)
                }
            }
            .padding(8)
            
            Text("PROFILE")
//               .customFont
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 32)
                .padding(.top, 25)
            
            VStack(alignment: .leading, spacing: 0){
                ForEach(menuItems2) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    MenuRowProfile(item: item, selectedMenu: $selectedMenu)
                }
            }
            .padding(8)
            
            Spacer()
            
            HStack(spacing: 14){
                Image(systemName: menuItems3[0].icon)
                    .frame(width: 32, height: 32)
                    .opacity(0.6)
                    .padding(.leading, 20)
                Text(menuItems3[0].text)
//                    .customFont()
                Toggle("", isOn: $isDarkMode)
                    .padding(.trailing, 20)
            }
//            VStack(alignment: .leading, spacing: 0){
//                ForEach(menuItems3) { item in
//                    Rectangle()
//                        .frame(height: 1)
//                        .opacity(0.1)
//                        .padding(.horizontal)
//                    MenuRowProfile(item: item, selectedMenu: $selectedMenu)
//                }
//            }
//            .padding(8)
            
            Spacer()
            
        }
        .foregroundColor(.black)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Constants.Colors.primaryColor).opacity(0.9)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct SideMenuProfile_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuProfile()
    }
}


struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var menu: SelectedMenuItem
}

var menuItems = [
    MenuItem(text: "HOME", icon: "circle", menu: .home),
    MenuItem(text: "FAVORITES", icon: "circle", menu: .favorites),
    MenuItem(text: "MESSAGES", icon: "circle", menu: .messages),
    MenuItem(text: "ADD NEW PRODUCT", icon: "circle", menu: .addNewProduct)
]

var menuItems2 = [
    MenuItem(text: "CONFIGURATION", icon: "circle", menu: .configuration),
    MenuItem(text: "SUPPORT", icon: "circle", menu: .support),
    MenuItem(text: "ANALYTICS", icon: "circle", menu: .analytics)
]

var menuItems3 = [
    MenuItem(text: "Dark Mode", icon: "circle", menu: .home)
]



enum SelectedMenuItem: String {
    case home
    case favorites
    case messages
    case addNewProduct
    case analytics
    case configuration
    case support
    case darkmode
}
