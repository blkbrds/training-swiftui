//
//  FormInputView.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 15/05/2023.
//

import SwiftUI


@ViewBuilder
func formInputView(email: Binding<String>, password: Binding<String>, isSecure: Bool, isValidate: Bool, geo: GeometryProxy, toggle: @escaping () -> Void) -> some View {
    VStack(spacing: 20) {
        VStack(alignment: .leading, spacing: 8) {
            Text("Email")
                .foregroundColor(.gray)
                .font(.headline)
                .padding(.horizontal, 20)
                .padding(.top, 20)

            HStack {
                TextField(Strings.Login.placeHolderEmail, text: email)
                    .padding(.horizontal, 20)
                Button(action: {
                    toggle()
                }) {
                    Image(isValidate ? "check" : "")
                }
                    .padding(.trailing, 20)
            }
        }
            .frame(height: geo.size.height * 0.07)
        VStack(alignment: .leading, spacing: 8) {
            Text("Password")
                .foregroundColor(.gray)
                .font(.headline)
                .padding(.horizontal, 20)
                .padding(.top, 20)

            HStack {
                isSecure ?
                SecureField(Strings.Login.placeHolderPassword, text: password)
                    .padding(.horizontal, 20)
                    .textFieldStyle(.plain)
                    .padding(.bottom, 20)
                :
                    SecureField(Strings.Login.placeHolderPassword, text: password)
                    .padding(.horizontal, 20)
                    .textFieldStyle(.plain)
                    .padding(.bottom, 20)

                Button(action: {
                    toggle()
                }) {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
                }
                    .padding(.trailing, 20)
            }
        }
            .frame(height: geo.size.height * 0.07)

        Text(Strings.Login.titleLogin)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .foregroundColor(Color(hex: "#4552CB"))
            .font(.footnote)
            .padding(.trailing, 20)

        Button {
            // handle later
        } label: {
            Text(Strings.Login.signIn)
                .foregroundColor(.white)
        }
            .commonButton(paddingHorizontal: geo.size.height * 0.03, paddingVertical: geo.size.height * 0.03)

    }

        .background(Color.white)
        .cornerRadiusCommon()
        .padding(.horizontal, 24)
}
