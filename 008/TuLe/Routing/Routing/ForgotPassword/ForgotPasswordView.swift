//
//  ForgotPasswordView.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 11/05/2023.
//

import SwiftUI

struct ForgotPasswordView: View {

    @StateObject var viewModel = ForgotPasswordViewModel()
    @Binding var shouldPopToRootView : Bool

    var body: some View {
        VStack {
            Text("Forgot password")
                .font(.title)
                .fontWeight(.heavy)
            VStack (alignment: .leading, spacing: 20) {
                UnderlineTextFieldView(title: "Email", value: $viewModel.email)
                if !viewModel.email.isValidEmail() && viewModel.email != "" {
                    ErrorView(imageName: ErrorType.wrong.getImageError(), messageError: "Email invalidate")
                        .padding(.leading, 15)
                }
            }
            .padding(.top, 30)
            
            Button {
                print("")
            } label: {
                Text("Send email")
                    .frame(maxWidth: .infinity)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.vertical, 17)
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [
                            Color(red: 251 / 255, green: 138 / 255, blue: 127 / 255),
                            Color(red: 252 / 255, green: 192 / 255, blue: 104 / 255)
                        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .scaleEffect(x: viewModel.isForgotDisable() ? 1 : 0, y: 1)
            )
            .background(.gray)
            .disabled(!viewModel.isForgotDisable())
            .cornerRadius(10)
            .padding()
            
            HStack {
                Text("Already have an account? ")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                Button {
                    shouldPopToRootView = false
                } label: {
                    Text("Sign in")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(.pink)
                }
            }

            Spacer()
        }
        .animation(Animation.default)
        .padding(.horizontal, 30)
    }
}


