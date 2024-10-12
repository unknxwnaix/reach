//
//  InputFieldView.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 30-09-2024.
//

import SwiftUI

struct InputFieldView: View {
    var hint: String
    var imageName: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 18, height: 18)
                .foregroundColor(Color("textColor"))
            if isSecure {
                SecureField(hint, text: $text)
                    .font(.customRoundedFont(.medium))
                    .foregroundColor(Color("textColor"))
                    .colorScheme(.light)
            } else {
                TextField(hint, text: $text)
                    .font(.customRoundedFont(.medium))
                    .foregroundColor(Color("textColor"))
                    .colorScheme(.light)
            }
        }
        .padding()
        .background(Color.white)
        .frame(maxWidth: .infinity)
    }
}
