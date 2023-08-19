//
//  SideMenuProfile.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 15.8.2023.
//

import SwiftUI

struct ProfileSideMenu: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var selectedMenu: SelectedMenuItem = .home
    @State var isDarkMode = false
    
    @State private var isLoggedIn = UserDefaults.standard.string(forKey: kIsLoggedIn) ?? ""
    @State private var profileEmail = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    @State private var showLogoutConfirmation = false
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                        showLogoutConfirmation.toggle()
                    }) {
                        Image(systemName: "person")
                            .padding(12)
                            .background(.white.opacity(0.2))
                            .mask(Circle())
                    }
                VStack(alignment: .leading, spacing: 2) {
                    Text(profileEmail)
                        .customFont(.body)
                    Text("Partners since 2021")
                        .customFont(.headline)
                        .opacity(0.7)
                }
                Spacer()
            }
            .padding()
            .padding(.leading, -45)
            .background(Constants.Colors.primaryColor).opacity(0.9)
            
            if showLogoutConfirmation {
                    showLogoutBox()
                }
            
            Text("BROWSE")
                .customFont(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 32)
                .padding(.top, 25)
            
            VStack(alignment: .leading, spacing: 0){
                ForEach(menuItems) { item in
                    Rectangle()
                        .frame(height: 2)
                        .opacity(0.1)
                        .padding(.horizontal)
                        .foregroundColor(Constants.Colors.primaryColor).opacity(0.9)
                    ProfileMenuRow(item: item, selectedMenu: $selectedMenu)
                }
            }
            .padding(8)
            
            Text("PROFILE")
                .customFont(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 32)
                .padding(.top, 25)
            
            VStack(alignment: .leading, spacing: 0){
                ForEach(menuItems2) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                        .foregroundColor(Constants.Colors.primaryColor).opacity(0.9)
                    ProfileMenuRow(item: item, selectedMenu: $selectedMenu)
                }
            }
            .padding(8)
            
            VStack{
                Spacer()
                
                HStack(spacing: 5){
                    Image(systemName: menuItems3[0].icon)
                        .frame(width: 32, height: 32)
                        .opacity(0.6)
                        .padding(.leading, 20)
                    Text(menuItems3[0].text)
                        .customFont(.headline)
                    Toggle("", isOn: $isDarkMode)
                        .toggleStyle(SwitchToggleStyle(tint: Constants.Colors.primaryColor))
                        .padding(.trailing, 25)
                }
                
                Spacer()
            }
            
            Spacer()
            
        }
        .foregroundColor(.black)
        .frame(maxWidth: 278, maxHeight: .infinity)
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.horizontal, -5)
    }
    
    //Extra functions
    func showLogoutBox() -> some View {
        VStack {
                Text("Do you want to log out?")
                    .customFont(.headline)
                    .padding()
                
            HStack{
                    Spacer()
                    Button("No") {
                        showLogoutConfirmation.toggle()
                    }
                    .foregroundColor(.primary)
                    .customFont(.subheadline)
                    
                    Spacer()
                    Button("Yes") {
                        logout()
                    }
                    .foregroundColor(.primary)
                    .customFont(.subheadline)
                
                    Spacer()
                }
                .padding(.horizontal)
            }
            .shadow(radius: 5, x: 0, y: 2)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .padding()
            
    }
    
    func logout() {
            UserDefaults.standard.set(false, forKey: kIsLoggedIn)
            showLogoutConfirmation = false
            presentationMode.wrappedValue.dismiss()
        
        }
}

struct ProfileSideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSideMenu()
    }
}



