//
//  SignInView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 17.8.2023.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        
        ZStack{
            
            Image("Tori-background2")
                .resizable()
//                .scaledToFit()
                .blur(radius: 7)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            VStack (spacing: 24){

                Text("Sign In")
                    .customFont(.largeTitle).bold()
                Text("Tori is the largest and most popular shopping place in Finland. Every month, more than 3 million Finns make good deals and discoveries!")
                    .customFont(.body)
                Divider()

                VStack(alignment: .leading){
                    Text("Email")
                        .customFont(.subheadline)
                        .foregroundColor(.gray)
                    TextField("", text: $email)
                        .customTextField(image: Image(systemName: "envelope"))
                }

                VStack(alignment: .leading){
                    Text("Passowrd")
                        .customFont(.subheadline)
                        .foregroundColor(.gray)
                    SecureField("", text: $password)
                        .customTextField(image: Image(systemName: "lock"))
                }

                Label("Sign In", systemImage: "arrouw.right")
                    .customFont(.body)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(Constants.Colors.primaryColor).opacity(0.9)
                    .foregroundColor(.white)
                    .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                    .cornerRadius(8, corners: [.topLeft])
                    .shadow(color: Constants.Colors.primaryColor, radius: 20, x: 0, y: 10)

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
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

