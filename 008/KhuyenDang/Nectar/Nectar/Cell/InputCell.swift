//
//  InputCell.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/05/2023.
//

import SwiftUI

enum InputType {
    case email
    case password
    case confirmPassword
    case username

    var title: String {
        switch self {
        case .email:
            return "Email"
        case .password:
            return "Password"
        case .confirmPassword:
            return "Confirm Password"
        case .username:
            return "Username"
        }
    }
}

struct InputCell: View {

    @Binding var value: String
    var type: InputType
    @State var isShowPass: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(type.title.description)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.gray)
                .padding(.top)
            switch type {
            case .password, .confirmPassword:
                if isShowPass {
                    HStack {
                        TextField("", text: $value)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .font(.system(size: 18))

                        Button(action: { isShowPass.toggle() }) {
                            Image(systemName: isShowPass ? "eye" : "eye.slash")
                                .foregroundColor(.gray)
                        }
                    }
                } else {
                    HStack {
                        SecureField("", text: $value)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .font(.system(size: 18))

                        Button(action: { isShowPass.toggle() }) {
                            Image(systemName: isShowPass ? "eye" : "eye.slash")
                                .foregroundColor(.gray)
                        }
                    }
                }
            default:
                HStack {
                    TextField("", text: $value)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .font(.system(size: 18))

                    if validate() {
                        Image("green_tick")
                    }
                }
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("light_gray"))
        }
    }

    private func validate() -> Bool {
        if type == .email {
            return value.validateEmail()
        } else {
            return !value.isEmpty
        }
    }
}

struct InputCell_Previews: PreviewProvider {

    static var previews: some View {
        LoginView()
    }
}
