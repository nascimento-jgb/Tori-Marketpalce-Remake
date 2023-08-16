//
//  FiltersSideMenu.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 16.8.2023.
//

import SwiftUI

struct FiltersSideMenu: View {
    
    @State var locationSearchBar: String = ""
    
    var body: some View {
        
        ZStack{
            
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
                    .padding(.leading, -40)
                    .background(Constants.Colors.primaryColor).opacity(0.9)
                    
                ScrollView{
                    
                    Text("Sort by:")
                    //               .customFont
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
//                    TextField("", text: )
//                        .padding(.vertical, 4)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.white)
//                                .shadow(radius: 3)
//                        )
//                        .padding(8)
                    
                    Text("Location:")
                    //               .customFont
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
//                    TextField("Type here your search area", text: $locationSearchBar)
//                        .padding(.vertical, 4)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.white)
//                                .shadow(radius: 3)
//                        )
//                        .padding(8)
                    
                    Text("Type of sale:")
                    //               .customFont
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
//                    TextField("Type your search area", text: $locationSearchBar)
//                        .padding(.vertical, 10)
//                        .padding(.horizontal, 20)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.white)
//                                .shadow(radius: 3)
//                                .frame(width: 250, height: 30)
//                        )
//                        .padding(8)
                    
                    Text("Price Range:")
                    //               .customFont
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
//                    TextField("Type here your search area", text: )
//                        .padding(.vertical, 4)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.white)
//                                .shadow(radius: 3)
//                        )
//                        .padding(8)
                    
                    Text("Filters Subcategories:")
                    //               .customFont
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
//                    TextField("Type here your search area", text: "")
//                        .padding(.vertical, 4)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.white)
//                                .shadow(radius: 3)
//                        )
//                        .padding(8)
                    
                    
//                    Spacer()
                }
                
            }
            .foregroundColor(.black)
            .frame(maxWidth: 278, maxHeight: .infinity)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 1)
        }
    }
}

struct FiltersSideMenu_Previews: PreviewProvider {
    static var previews: some View {
        FiltersSideMenu()
    }
}
