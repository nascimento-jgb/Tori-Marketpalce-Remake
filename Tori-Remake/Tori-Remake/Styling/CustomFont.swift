//
//  CustomFont.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 17.8.2023.
//

import Foundation
import SwiftUI

struct CustomFont: ViewModifier {
    
    var textStyle: TextStyle
    
    var size: CGFloat {
        switch textStyle {
        case .largeTitle:
            return 34
        case .title:
            return 28
        case .title2:
            return 24
        case .title3:
            return 20
        case .body:
            return 17
        case .headline:
            return 16
        case .subheadline:
            return 15
        }
    }
    
    var relative: Font.TextStyle {
        switch textStyle {
        case .largeTitle:
            return .largeTitle
        case .title:
            return .title
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .body:
            return .body
        case .headline:
            return .headline
        case .subheadline:
            return .subheadline
        }
        
    }
    
    func body(content: Content) -> some View {
        content.font(.custom("SchibstedGrotesk-Regular", size: size, relativeTo: relative))
    }
}
extension View {
    func customFont(_ textStyle: TextStyle) -> some View {
        modifier(CustomFont(textStyle: textStyle))
    }
}

enum TextStyle {
    case subheadline
    case headline
    case largeTitle
    case title2
    case title3
    case title
    case body
}


//- SchibstedGrotesk-Regular
//- SchibstedGrotesk-Italic
//- SchibstedGrotesk-Regular_Medium
//- SchibstedGrotesk-Italic_Medium-Italic
//- SchibstedGrotesk-Regular_SemiBold
//- SchibstedGrotesk-Italic_SemiBold-Italic
//- SchibstedGrotesk-Regular_Bold
//- SchibstedGrotesk-Italic_Bold-Italic
//- SchibstedGrotesk-Regular_ExtraBold
//- SchibstedGrotesk-Italic_ExtraBold-Italic
//- SchibstedGrotesk-Regular_Black
//- SchibstedGrotesk-Italic_Black-Italic
