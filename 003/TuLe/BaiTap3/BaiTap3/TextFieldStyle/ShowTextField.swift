//
//  ShowTextField.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 20/02/2023.
//

import SwiftUI

struct ShowTextField: View {

    @State var userName: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            TextField("nhập Username", text: $userName)
                .modifierTextField()
            
            SecureField("nhập password", text: $password)
                .modifierTextField()
        }
    }
}

struct ShowTextField_Previews: PreviewProvider {
    static var previews: some View {
        ShowTextField()
    }
}

extension View  {
    func modifierTextField() -> some View {
        ModifiedContent(
            content: self,
            modifier: TextFieldModifier()
        )
    }
}
