//
//  ShowTextField.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 20/02/2023.
//

import SwiftUI

struct ShowTextField: View {

    @State var username: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .exercise6TextFieldModifier()
            
            SecureField("Password", text: $password)
                .exercise6TextFieldModifier()
        }
    }
}

struct ShowTextField_Previews: PreviewProvider {
    static var previews: some View {
        ShowTextField()
    }
}

extension View  {
    func exercise6TextFieldModifier() -> some View {
        ModifiedContent(
            content: self,
            modifier: TextFieldModifier()
        )
    }
}
