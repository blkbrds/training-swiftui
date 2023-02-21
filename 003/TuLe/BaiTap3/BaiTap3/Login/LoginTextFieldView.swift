//
//  LoginTextFieldView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 21/02/2023.
//

import SwiftUI

struct LoginTextFieldView: View {
    
    @Binding var data: String
    var placeholder: String
    var isShowPassword: Bool?
    
    var body: some View {
        if let isShowPassword = isShowPassword, isShowPassword {
            SecureField(placeholder, text: $data)
                .loginTextFieldModifier()
        } else {
            TextField(placeholder, text: $data)
                .loginTextFieldModifier()
        }
    }
}

extension View  {
    func loginTextFieldModifier() -> some View {
        ModifiedContent(
            content: self,
            modifier: LoginTextFieldModifier()
        )
    }
}
