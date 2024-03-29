//
//  PasswordTextField.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 29.03.2024.
//

import SwiftUI

struct PasswordTextField: View
{
    private var title: String
    @Binding private var text: String
    private var isSecure: Bool
    
    init(_ title: String, text: Binding<String>, isSecure: Bool) {
        self.title = title
        self._text = text
        self.isSecure = isSecure
    }
    
    var body: some View {
        Group {
            HStack(spacing: 12){
                Image("PasswordIcon")
                if isSecure {
                    SecureField(title, text: $text).frame(alignment: .center).font(.custom("Fugue-Regular", size: 16))
                } else {
                    TextField(title, text: $text).frame(alignment: .center).font(.custom("Fugue-Regular", size: 16))
                }
            }.padding(16).frame(maxWidth: .infinity).background(Color.white).cornerRadius(10)
        }
    }
}
