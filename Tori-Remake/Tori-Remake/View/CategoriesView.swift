//
//  CategoriesView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        
        ScrollView(.horizontal)
        {
            LazyHStack(spacing: 15){
                ForEach(Category.allCases, id: \.self) { category in
                    if let imageHolder = categoryImages[category] {
                        VStack{
                            Image(imageHolder)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding(.bottom, 2)
                            
                            Text(category.rawValue.capitalized)
                                .foregroundColor(.black)
                                .font(.caption)
                        }
                    }
                }
            }
            .padding(.leading, 5)
            .padding()
        }
        .frame(height: 150)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
