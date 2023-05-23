//
//  LoginView.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 16/05/2023.
//

import SwiftUI

struct LoginView: View {

    // MARK: - State
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
                    Color("background1")
                        .frame(height: height * 0.4)

                    VStack() {
                        Spacer()

                        HStack {
                            Rectangle()
                                .fill(Color.gray)
                                .opacity(0.2)
                                .frame(height: 1)
                            Text("or continue with")
                                .multilineTextAlignment(.center)
                                .lineLimit(0)
                                .minimumScaleFactor(0.5)
                            Rectangle()
                                .fill(Color.gray)
                                .opacity(0.2)
                                .frame(height: 1)
                        }

                        HStack(alignment: .center, spacing: 30) {
                            Image("facebook")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .center)
                                .onTapGesture {
                                // action
                            }


                            Image("google")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .center)
                                .onTapGesture {
                                // action
                            }
                        }

                        HStack() {
                            Text("Dont have account yet?")
                            Button {
                                // handle later
                            } label: {
                                Text("Registration")
                                    .bold()
                                    .foregroundColor(Color("textColor"))
                            }
                        }
                            .padding(.bottom, paddingBottom)
                            .padding(.top, paddingBottom)
                    }
                        .frame(height: height * 0.6)
                        .background(Color("background2"))
                }
            }
                .edgesIgnoringSafeArea(.all)

            GeometryReader { geo in
                VStack() {

                    VStack {
                        Text("Sign In")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 40)
                            .padding(.top, 20)
                    }

                    formInput(geo: geo)
                }
            }
        }
    }
    
    fileprivate func formInput(geo: GeometryProxy) -> some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Email")
                    .foregroundColor(.gray)
                    .font(.headline)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                
                HStack {
                    TextFieldView(data: $email, kind: .userName)
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
                    TextFieldView(data: $password, kind: .password)
                    :
                    TextFieldView(data: $password, kind: .password)
                    
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(systemName: isSecure ? "eye.slash" : "eye")
                    }
                    .padding(.trailing, 20)
                }
            }
            .frame(height: geo.size.height * 0.07)
            
            Text("Do not rebember the password?")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(Color("textColor"))
                .font(.footnote)
                .padding(.trailing, 20)
                .onTapGesture {
                    // handler later
                }
            ButtonView(titleButton: "Sign In") {
                // handler later
            }
            .padding(.horizontal, geo.size.height * 0.03)
            .padding(.vertical, geo.size.height * 0.03)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .padding(.horizontal, 24)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
