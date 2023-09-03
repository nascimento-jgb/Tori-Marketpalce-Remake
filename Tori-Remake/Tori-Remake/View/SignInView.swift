//
//  SignInView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 17.8.2023.
//

import CoreData
import SwiftUI

let kEmail: String = "email key"
let kPassword: String = "password key"
let kIsLoggedIn: String = "is logged in key"

struct SignInView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var viewModel: MainMenuViewModel
    
    @State var email = ""
    @State var password = ""
    @State var showAlert = false
    @State var isLoggedIn = false
    
    init(
        viewModel: MainMenuViewModel
    ){
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Image("Tori-background2")
                    .resizable()
                    .blur(radius: 7)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack (spacing: 24){
                    
                    Text("Sign In")
                        .customFont(.largeTitle).bold()
                    Text("Tori is the largest and most popular shopping place in Finland. Every month, more than 3 million Finns make good deals and discoveries!")
                        .customFont(.body)
                    Divider()
                    
                    EmailTextFieldView(email: $email)
                    PasswordTextFieldView(password: $password)
                    
                    Button {
                        let loginSuccessful = viewModel.loginUser(email: email, password: password)
                            if loginSuccessful {
                                isLoggedIn = true
                            } else {
                                showAlert = true
                            }
                    } label: {
                        Label("Sign In", systemImage: "arrow.right")
                            .customFont(.body)
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .background(Constants.Colors.primaryColor).opacity(0.9)
                            .foregroundColor(.white)
                            .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                            .cornerRadius(8, corners: [.topLeft])
                            .shadow(color: Constants.Colors.primaryColor, radius: 20, x: 0, y: 10)}
                    
                    HStack{
                        Rectangle().frame(height: 1).opacity(0.1)
                        Text("OR").customFont(.subheadline).foregroundColor(.black).opacity(0.3)
                        Rectangle().frame(height: 1).opacity(0.1)
                    }
                    
                    Text("Sign up with Email, Apple or Google")
                        .customFont(.subheadline)
                        .foregroundColor(.gray)
                    
                    HStack{
                        Image("Logo Email")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Spacer()
                        Image("Logo Apple")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Spacer()
                        Image("Logo Google")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                }
                .padding(30)
                .background(.regularMaterial)
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(radius: 5, x: 0, y: 3)
                .shadow(radius: 30, x: 0, y: 30)
                .padding(20)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please enter a valid email."),
                    dismissButton: .default(Text("OK"))
                )}
            .onAppear{
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
                
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                    MainMenuView(viewModel: viewModel)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}



struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyViewModel = MainMenuViewModel()
        
        return SignInView(viewModel: dummyViewModel)
    }
}



