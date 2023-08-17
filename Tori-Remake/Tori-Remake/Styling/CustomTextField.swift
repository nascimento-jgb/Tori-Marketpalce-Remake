//
//  SwiftUIView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 17.8.2023.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    var image: Image
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke()
                    .fill(.black.opacity(0.1))
            )
            .overlay(
                image
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
            )
    }
}

extension View {
    func customTextField(image: Image = Image(systemName: "")) -> some View {
        modifier(CustomTextField(image: image))
    }
}
