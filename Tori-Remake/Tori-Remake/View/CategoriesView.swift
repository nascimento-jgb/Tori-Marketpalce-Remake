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
                ForEach(0..<7) { index in
                    VStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.red)
                            .frame(width: 100, height: 100)
                            .padding(.bottom, 2)
                        
                        Text("Category \(index + 1)")
                            .foregroundColor(.black)
                            .font(.caption)
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
