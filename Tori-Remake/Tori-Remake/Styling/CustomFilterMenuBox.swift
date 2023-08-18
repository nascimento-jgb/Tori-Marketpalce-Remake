//
//  CustomFilterMenuBox.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 18.8.2023.
//

import Foundation
import SwiftUI

struct CustomMenuFilterBox: ViewModifier {
    
    @Binding var selectedItem: String
    
    var items: [String]
    var action: (String) -> Void
    
    func body(content: Content) -> some View {
        Menu {
            ForEach(items, id: \.self) { item in
                Button(item) {
                    selectedItem = item
                    action(item)
                }
            }
        } label: {
            content
                .frame(width: 250, height: 30)
                .foregroundColor(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Constants.Colors.primaryColor.opacity(0.7), lineWidth: 1)
                        .shadow(radius: 3)
                }
                .overlay(
                    HStack {
                        Text(selectedItem)
                            .customFont(.headline)
                            .foregroundColor(.black)
                        Image(systemName: "chevron.down")
                            .foregroundColor(Constants.Colors.primaryColor.opacity(0.7))
                    }
                    .padding(.horizontal)
                )
        }
        .padding(3)
    }
}

extension View {
    func customMenuFilterBox(items: [String], selectedItem: Binding<String>, action: @escaping (String) -> Void) -> some View {
        modifier(CustomMenuFilterBox(selectedItem: selectedItem, items: items, action: action))
    }
}
