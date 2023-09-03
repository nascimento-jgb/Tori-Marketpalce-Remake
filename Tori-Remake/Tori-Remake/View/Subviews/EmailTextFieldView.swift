//
//  EmailTextFieldView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 3.9.2023.
//

import SwiftUI

struct EmailTextFieldView: View {
    @Binding var email: String

    var body: some View {
        VStack(alignment: .leading){
            Text("Email")
                .customFont(.subheadline)
                .foregroundColor(.gray)
            TextField("", text: $email, onEditingChanged: { _ in }, onCommit: {
                    email = email.lowercased() // Convert entered email to lowercase
                })
                .customTextField(image: Image(systemName: "envelope"))
        }
    }
}

struct EmailTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextFieldView(email: .constant(""))
    }
}
