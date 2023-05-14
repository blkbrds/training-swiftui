//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 13/05/2023.
//

import SwiftUI

struct LoginView: View {

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    @State private var isValidate: Bool = false

    var body: some View {
        ZStack() {
            GeometryReader { geometry in
                let height = geometry.size.height
                let paddingBottom = height * 0.1
                VStack(spacing: 0) {
                    Color(hex: "#4552CB")
                        .frame(height: height * 0.4)

                    VStack() {
                        Spacer()

                        HStack {
                            Rectangle()
                                .fill(Color.gray)
                                .opacity(0.2)
                                .frame(height: 1)
                            Text(Strings.Login.continueString)
                                .multilineTextAlignment(.center)
                                .lineLimit(0)
                                .minimumScaleFactor(0.5)
                            Rectangle()
                                .fill(Color.gray)
                                .opacity(0.2)
                                .frame(height: 1)
                        }

                        HStack(alignment: .center, spacing: 30) {
                            ThreeSideView(imageString: "facebook") {
                                // login facebook
                            }
                            ThreeSideView(imageString: "google") {
                                // login google
                            }
                        }

                        HStack() {
                            Text(Strings.Login.dontHaveAccount)
                            Button {
                                // handle later
                            } label: {
                                Text(Strings.Login.register)
                                    .bold()
                                    .foregroundColor(Color(hex: "#4552CB"))
                            }
                        }
                            .padding(.bottom, paddingBottom)
                            .padding(.top, paddingBottom)
                    }
                        .frame(height: height * 0.6)
                        .background(Color(hex: "E5E5E5"))



                }
            }
                .edgesIgnoringSafeArea(.all)

            // View nằm chồng giữa 2 view
            GeometryReader { geo in
                VStack() {

                    VStack {
                        Text(Strings.Login.signIn)
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 40)
                            .padding(.top, 20)
                    }
                    formInputView(geo: geo)
                }
            }
        }
    }
    
    @ViewBuilder
    func formInputView(geo: GeometryProxy) -> some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Email")
                    .foregroundColor(.gray)
                    .font(.headline)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)

                HStack {
                    TextField(Strings.Login.placeHolderEmail, text: $email)
                        .padding(.horizontal, 20)
                    Button(action: {
                        isSecure.toggle()
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
                    SecureField(Strings.Login.placeHolderPassword, text: $password)
                        .padding(.horizontal, 20)
                        .textFieldStyle(.plain)
                        .padding(.bottom, 20)
                    :
                    SecureField(Strings.Login.placeHolderPassword, text: $password)
                        .padding(.horizontal, 20)
                        .textFieldStyle(.plain)
                        .padding(.bottom, 20)
                    
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(systemName: isSecure ? "eye.slash" : "eye")
                    }
                    .padding(.trailing, 20)
                }
            }
            .frame(height: geo.size.height * 0.07)

            Text("Do not remember the password?")
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

