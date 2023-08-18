//
//  FiltersSideMenu.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 16.8.2023.
//

import SwiftUI

struct FiltersSideMenu: View {
    
    @State private var showFilteredMenu = false
    @State private var showTypeOfSaleMenu = false
    
    @Binding var selectedFilter: String
    @Binding var selectedTypeOfSale: String
    @Binding var minProductValue: String
    @Binding var maxProductValue: String
    @Binding var locationSearchBar: String
    @Binding var categoryStatus: String
    
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
                            Text("JOAO NASCIMENTO")
                                .customFont(.body)
                            Text("Partners since 2021")
                                .customFont(.headline)
                                .opacity(0.7)
                        }
                        Spacer()
                    }
                    .padding()
                    .padding(.leading, -40)
                    .background(Constants.Colors.primaryColor).opacity(0.9)
                    
                ScrollView{
                    
                    Text("Sorted by:")
                        .customFont(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
                    Text("")
                        .customMenuFilterBox(items: ["Newest", "Oldest", "Cheapest", "Expensier"], selectedItem: $selectedFilter){ item in
                            selectedFilter = item
                    }
                    
                    Text("Location:")
                        .customFont(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
                    TextField("Find in your area", text: $locationSearchBar)
                        .customFont(.headline)
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
                        .customFont(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
                    Text("")
                        .customMenuFilterBox(items: ["For Sale", "Want to Buy", "Want to Give", "For Rent", "Want to Rent"], selectedItem: $selectedTypeOfSale){ item in
                            selectedTypeOfSale = item
                        }
                    
                    Text("Price Range:")
                        .customFont(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
                    HStack{
                        TextField("Min", text: $minProductValue)
                            .customFont(.headline)
                            .customFilterRangeBox()
                        
                        Spacer()
                        
                        TextField("Max", text: $maxProductValue)
                            .customFont(.headline)
                            .customFilterRangeBox()
                    }
                    .padding()
                    
                    Text("Aditional Filters:")
                        .customFont(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
                    HStack {
                        Text("\(categoryStatus)")
                            .customFilterAditional(label: "\(categoryStatus)", categoryStatus: categoryStatus) {
                                // Still need to add the action for each category
                                showTypeOfSaleMenu.toggle()
                            }
                    }
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
    @State static private var selectedFilterCategory: String = "Newest"
    @State static private var selectedTypeOfSale: String = "For Sale"
    @State static private var minProductValue: String = ""
    @State static private var maxProductValue: String = ""
    @State static private var locationSearchBar: String = ""

    static var previews: some View {
        FiltersSideMenu(
                                selectedFilter: .constant("Category"),
                                selectedTypeOfSale: .constant("Sale"),
                                minProductValue: .constant("0"),
                                maxProductValue: .constant("100"),
                                locationSearchBar: .constant("Location"),
                                categoryStatus: .constant("")
                                )
    }
}
