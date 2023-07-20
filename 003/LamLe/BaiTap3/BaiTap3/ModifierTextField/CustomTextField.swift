//
//  CustomTextField.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/20/23.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    @State var value: String
    var isPassword: Bool
    
    var body: some View {
        if !isPassword {
            TextField(title, text: $value)
                .cuteTextField()
        } else {
            SecureField(title, text: $value)
                .cuteTextField()
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(title: "TextField", value: "", isPassword: true)
    }
}
