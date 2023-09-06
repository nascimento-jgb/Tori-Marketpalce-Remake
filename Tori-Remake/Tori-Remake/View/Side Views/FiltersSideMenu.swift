//
//  FiltersSideMenu.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 16.8.2023.
//

import SwiftUI

struct FiltersSideMenu: View {
    @ObservedObject var viewModel: MainMenuViewModel
    @State private var showFilteredMenu = false
    @State private var showTypeOfSaleMenu = false
    
    var body: some View {
        
        ZStack{
            VStack{
                 HStack{
                    Spacer()
                    Image(systemName: "cart")
                        .padding(12)
                        .background(.white.opacity(0.2))
                        .mask(Circle())
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(viewModel.displayedProductCount) available products")
                            .customFont(.body)
                        Text("Let's find a good deal!")
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
                        .customMenuFilterBox(items: ["Newest", "Oldest", "Cheapest", "Expensier"], selectedItem: $viewModel.selectedFilter){ item in
                            viewModel.selectedFilter = item
                    }
                    
                    Text("Location:")
                        .customFont(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
                    TextField("Find in your area", text: $viewModel.locationSearchBar)
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
                        .customMenuFilterBox(items: ["For Sale", "Want to Buy", "Want to Give", "For Rent", "Want to Rent"], selectedItem: $viewModel.selectedTypeOfSale){ item in
                            viewModel.selectedTypeOfSale = item
                        }
                    
                    Text("Price Range:")
                        .customFont(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
                    HStack{
                        TextField("Min", text: $viewModel.minProductValue)
                            .customFont(.headline)
                            .customFilterRangeBox()
                        
                        Spacer()
                        
                        TextField("Max", text: $viewModel.maxProductValue)
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
                        Text("\(viewModel.categoryStatus)")
                            .customFilterAditional(label: "\(viewModel.categoryStatus)", categoryStatus: viewModel.categoryStatus) {
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
        
        let dummyViewModel = MainMenuViewModel()
        
        FiltersSideMenu(viewModel: dummyViewModel)
    }
}
