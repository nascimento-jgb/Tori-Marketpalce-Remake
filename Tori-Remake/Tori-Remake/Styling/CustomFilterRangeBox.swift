//
//  CustomFilterRangeBox.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 18.8.2023.
//

import Foundation
import SwiftUI

struct CustomFilterRangeBox : ViewModifier {
    
    func body(content: Content) -> some View{
        content
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
    }
}

extension View {
    func customFilterRangeBox() -> some View {
        modifier(CustomFilterRangeBox())
    }
}
