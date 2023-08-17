//
//  MenuRowProfile.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 16.8.2023.
//

import SwiftUI

struct ProfileMenuRow: View {
    
    var item: MenuItem
    @Binding var selectedMenu: SelectedMenuItem
    
    var body: some View {
        HStack{
            Image(systemName: item.icon)
                .font(.system(size: 25))
                .opacity(0.6)
                .frame(alignment: .leading)
                .padding(.horizontal, 10)
                
            Text(item.text)
                .customFont(.subheadline)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .fill(Constants.Colors.primaryColor.opacity(0.6))
                .frame(maxWidth: selectedMenu == item.menu ? .infinity : 0)
                .frame(maxWidth: .infinity, alignment: .leading))
        .onTapGesture {
            withAnimation(.timingCurve(0.2, 0.8, 0.2, 1)){
                selectedMenu = item.menu
            }
        }
    }
}

struct ProfileMenuRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMenuRow(item: menuItems[0], selectedMenu: .constant(.home))
    }
}
