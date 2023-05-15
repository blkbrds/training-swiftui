//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 13/05/2023.
//

import SwiftUI

struct LoginView: View {

    // MARK: - State
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    @State private var isValidate: Bool = false

    // MARK: - Body
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

                    // form input
                    formInputView(email: $email, password: $password, isSecure: isSecure, isValidate: isValidate, geo: geo) {
                        isSecure.toggle()
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
