//
//  TextFieldDemoView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 28/06/2023.
//

import SwiftUI

struct TextFieldDemoView: View {

    @State var username: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            TextFieldStyleView(type: .username, data: $username)
            TextFieldStyleView(type: .password, data: $password)
        }
    }
}

struct TextFieldDemoView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDemoView()
    }
}
