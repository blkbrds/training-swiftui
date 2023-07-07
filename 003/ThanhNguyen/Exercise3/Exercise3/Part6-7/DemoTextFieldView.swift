//
//  DemoTextFieldView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 07/07/2023.
//

import SwiftUI

struct DemoTextFieldView: View {

    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Register")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 40, weight: .thin, design: .serif))
            BaseTextField(data: $email, type: .email)
                .frame(maxHeight: 50)
            BaseTextField(data: $password, type: .password)
                .frame(maxHeight: 50)
            Spacer()
        }
        .padding()
    }
}

struct DemoTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        DemoTextFieldView()
    }
}
