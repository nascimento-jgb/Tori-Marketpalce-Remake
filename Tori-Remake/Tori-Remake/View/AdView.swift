//
//  AdView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import SwiftUI

struct AdView: View {
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(radius: 5)
                .frame(width: 400, height: 180)
                        
            HStack{
                Image("Shirt")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 200)
                    .padding(.leading, 1)
                
                VStack{
                    HStack{
                        Text("Title")
                            .padding(.leading, -5)
                            .font(.title2)
                        
                        Spacer()
                        
                        Image(systemName: "heart")
                            .padding(.trailing, 6)
                            .font(.title3)
                    }
                    .padding()
                    
//                    HStack{
//                        Text("INFO COMES HERE")
//                    }
//                    .padding()
                    
                    VStack(alignment: .leading){
                        Text("Location")
                        Text("Date")
                    }
                    .padding(.leading, -95)
                    .font(.title3)
                    .padding()
                    
                    HStack{
                        Spacer ()
                        Text("$ Price")
                            .font(.title2)
                            .padding(.trailing, 20)
                    }
                    .padding(.bottom, 12)
                    
                }
                .frame(height: 200)
               
                    
            }
            .frame(width: 400, height: 200)
        }
    }
}

struct AdView_Previews: PreviewProvider {
    static var previews: some View {
        AdView()
    }
}
