//
//  RegistrationView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/05/2023.
//

import SwiftUI

struct RegistrationView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            VStack {
                Image("carrot")
                Spacer()
                    .frame(height: 100)
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Sign Up")
                            .font(.system(size: 26, weight: .semibold))

                        Text("Enter your credentials to continue")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                    .padding(.bottom, 30)

                InputCell(value: $username, type: .username)
                InputCell(value: $email, type: .email)
                InputCell(value: $password, type: .password)

                HStack {
                    Text("By continuning you agree to our ")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        +
                        Text("Terms of Service ")
                        .foregroundColor(Color("green"))
                        .font(.system(size: 14))
                        +
                        Text("and ")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        +
                        Text("Privacy Policy.")
                        .foregroundColor(Color("green"))
                        .font(.system(size: 14))
                }
                    .padding(.top, 10)
                    .padding(.bottom, 20)

                Button(action: { },
                    label: {
                        Text("Sign Up")
                            .myButtonModifier()
                    })
                    .disabled(username.isEmpty || !email.validateEmail() || password.isEmpty)

                HStack(spacing: 10) {
                    Text("Already have an account?")
                        .font(.system(size: 14, weight: .semibold))
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    },
                        label: {
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color("green"))
                        })
                }
                    .padding(.top)
            }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            Spacer()
        }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
