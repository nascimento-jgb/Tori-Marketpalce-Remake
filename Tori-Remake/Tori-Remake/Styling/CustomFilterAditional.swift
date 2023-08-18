//
//  CustomFilterAditional.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 18.8.2023.
//

import Foundation
import SwiftUI

struct CustomFilterAditional: ViewModifier {
    var label: String
    var categoryStatus: String
    var action: () -> Void
    
    func body(content: Content) -> some View {
        Menu {
            // Add menu items here
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
                        Text(categoryStatus.isEmpty ? label : categoryStatus)
                            .customFont(.headline)
                            .foregroundColor(.black)
                        Image(systemName: "chevron.down")
                            .foregroundColor(Constants.Colors.primaryColor.opacity(0.7))
                    }
                    .padding(.horizontal)
                    .onTapGesture {
                        action()
                    }
                )
        }
        .padding(3)
    }
}

extension View {
    func customFilterAditional(label: String, categoryStatus: String, action: @escaping () -> Void) -> some View {
        modifier(CustomFilterAditional(label: label, categoryStatus: categoryStatus, action: action))
    }
}

