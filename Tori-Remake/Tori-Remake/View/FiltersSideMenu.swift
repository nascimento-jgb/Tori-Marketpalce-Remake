//
//  FiltersSideMenu.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 16.8.2023.
//

import SwiftUI

struct FiltersSideMenu: View {
    
    @State private var selectedFilterCategory = "Newest"
    @State private var showFilteredMenu = false
    @State private var selectedTypeOfSale = "For Sale"
    @State private var showTypeOfSaleMenu = false
    @State private var locationSearchBar: String = ""
    
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
                    
                    Text("Sorted by:")
                    //               .customFont
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
                    HStack {
                        Menu {
                            Button("Newest") {
                                selectedFilterCategory = "Newest"
                            }
                            Button("Oldest") {
                                selectedFilterCategory = "Oldest"
                            }
                            Button("Cheapest") {
                                selectedFilterCategory = "Cheapest"
                            }
                            Button("Expensier") {
                                selectedFilterCategory = "Expensier"
                            }
                        } label: {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 250, height: 30)
                                .foregroundColor(.white)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Constants.Colors.primaryColor.opacity(0.7), lineWidth: 1)
                                        .shadow(radius: 3)
                                }
                                .overlay(
                                    HStack {
                                        Text(selectedFilterCategory)
                                            .foregroundColor(.black)
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(Constants.Colors.primaryColor.opacity(0.7))
                                    }
                                    .padding(.horizontal)
                                    .onTapGesture {
                                        showFilteredMenu.toggle()
                                    }
                                )
                        }
                        .padding(3)
                    }
                    
                    Text("Location:")
                    //               .customFont
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
                    TextField("Find in your area", text: $locationSearchBar)
                        .padding(.leading, 25)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                                .frame(width: 250, height: 30)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Constants.Colors.primaryColor.opacity(0.7), lineWidth: 1)
                                        .shadow(radius: 3)
                                    }
                        )
                        .padding(8)
                    
                    
                    Text("Type of sale:")
                    //               .customFont
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
                    HStack {
                        Menu {
                            Button("For Sale") {
                                selectedTypeOfSale = "For Sale"
                            }
                            Button("Want to Buy") {
                                selectedTypeOfSale = "Want to Buy"
                            }
                            Button("Want to Give") {
                                selectedTypeOfSale = "Want to Give"
                            }
                            Button("For Rent") {
                                selectedTypeOfSale = "For Rent"
                            }
                            Button("Want to Rent") {
                                selectedTypeOfSale = "Want to Rent"
                            }
                           
                        } label: {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 250, height: 30)
                                .foregroundColor(.white)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Constants.Colors.primaryColor.opacity(0.7), lineWidth: 1)
                                        .shadow(radius: 3)
                                }
                                .overlay(
                                    HStack {
                                        Text(selectedTypeOfSale)
                                            .foregroundColor(.black)
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(Constants.Colors.primaryColor.opacity(0.7))
                                    }
                                    .padding(.horizontal)
                                    .onTapGesture {
                                        showTypeOfSaleMenu.toggle()
                                    }
                                )
                        }
                        .padding(3)
                    }
                    
                    Text("Price Range:")
                    //               .customFont
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
                    HStack{
                        TextField("Min", text: $locationSearchBar)
                            .padding(.leading, 35)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 100, height: 30)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Constants.Colors.primaryColor.opacity(0.7), lineWidth: 1)
                                            .shadow(radius: 3)
                                        }
                            )
                            .padding(.leading, -15)
                        
                        Spacer()
                        
                        TextField("Max", text: $locationSearchBar)
                            .padding(.leading, 35)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 100, height: 30)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Constants.Colors.primaryColor.opacity(0.7), lineWidth: 1)
                                            .shadow(radius: 3)
                                        }
                            )
                            .padding(.trailing, -15)
                    }
                    .padding()
                    
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
