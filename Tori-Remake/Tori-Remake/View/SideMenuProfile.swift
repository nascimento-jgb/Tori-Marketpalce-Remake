//
//  SideMenuProfile.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 15.8.2023.
//

import SwiftUI

struct SideMenuProfile: View {
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
                .padding(.top, 40)
            VStack{
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.1)
                    .padding(.horizontal)
                
                HStack{
                    Image(systemName: "person")
                        .font(.system(size: 32))
                        .opacity(0.6)
                    Text("HOME")
                    //                    .customFont()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(18)
            }
            .padding(8)
            
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
