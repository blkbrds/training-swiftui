//
//  CustomTextField.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    @State var value: String
    var isPassword: Bool

    var body: some View {
        if !isPassword {
            TextField(title, text: $value)
                .beautyTextField(isPassword: isPassword)
                .padding()
                .foregroundColor(isPassword == true ? .red : .blue)
        } else {
            SecureField(title, text: $value)
                .beautyTextField(isPassword: isPassword)
                .padding()
                .foregroundColor(isPassword == true ? .red : .blue)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(title: "TextField", value: "", isPassword: true)
    }
}
