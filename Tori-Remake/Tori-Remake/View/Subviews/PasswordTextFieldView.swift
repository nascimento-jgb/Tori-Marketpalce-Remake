//
//  PasswordTextFieldView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 3.9.2023.
//

import SwiftUI

struct PasswordTextFieldView: View {
    @Binding var password: String

    var body: some View {
        VStack(alignment: .leading){
            Text("Passowrd")
                .customFont(.subheadline)
                .foregroundColor(.gray)
            SecureField("", text: $password)
                .customTextField(image: Image(systemName: "lock"))
        }
    }
}

struct PasswordTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextFieldView(password: .constant(""))
    }
}
