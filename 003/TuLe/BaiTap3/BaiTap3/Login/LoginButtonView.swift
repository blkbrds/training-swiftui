//
//  LoginButtonView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 21/02/2023.
//

import SwiftUI

struct LoginButtonView: View {

    var email: String
    var password: String
    var gradientButton = Gradient(colors: [Color(red: 255 / 255, green: 188 / 255, blue: 70 / 255), Color(red: 254 / 255, green: 126 / 255, blue: 8 / 255)])

    var body: some View {
        Button {
            print("")
        } label: {
            Text("Login")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .fontWeight(.medium)
        }
        .background {
            if password != "" && email != "" {
                LinearGradient(gradient: gradientButton, startPoint: .topTrailing, endPoint: .bottomLeading)
            } else {
                Color(.gray)
            }
        }
        .cornerRadius(10)
        .padding(.horizontal, 40)
        .padding(.top, 20)
    }
}
