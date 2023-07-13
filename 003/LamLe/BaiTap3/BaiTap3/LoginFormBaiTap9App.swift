//
//  LoginFormBaiTap9App.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/10/23.
//

import SwiftUI

struct LoginFormBaiTap9App: View {
    
    @State var userName = ""
    @State var passWord = ""
    @State var checked = false
    @State var errorMessageUserName = ""
    @State var loginSuccess: Bool = false
    internal var didAppear: ((Self) -> Void)?
    
    func validationTextField() -> Bool {
        if (userName.isEmpty && passWord.isEmpty) {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Image("MyLogoBat")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 90)
                    .padding(50)
                VStack(alignment: .leading, spacing: 1.0) {
                    TextField("Username", text: $userName) { isBegin in
                        if isBegin {
                            print("Bắt đầu nhập")
                        } else {
                            print("Kết thúc nhập")
                            if userName.isEmpty {
                                errorMessageUserName = "Username is not empty"
                            } else {
                                errorMessageUserName = ""
                            }
                        }
                    }
                        .login(systemImageString: "person", isTextFieldPassword: false)
                        .tag("userNameTextField")
                    Text(errorMessageUserName)
                        .font(.system(size: 15, weight: .bold, design: .serif))
                        .foregroundColor(.red.opacity(0.8))
                }
                VStack {
                    SecureField("Password", text: $passWord)
                        .login(systemImageString: "lock", isTextFieldPassword: true)
                        .font(.system(size: 15, weight: .bold, design: .serif))
                        .foregroundColor(.red.opacity(0.8))
                        .tag("passWordTextField")
                }
                HStack(alignment: .center, spacing: 60.0) {
                    HStack {
                        Button(action: {
                            checked = !checked
                        }) {
                            CheckBoxView(checked: $checked)
                        }
                        Text("Remember Me")
                            .foregroundColor(checked == true ? .pink : .gray)
                            .italic()
                    }
                    Button(action: {
                        
                    }) {
                        Text("Forgot Password?")
                            .underline()
                            .foregroundColor(.blue.opacity(0.8))
                    }
                }
                VStack {
                    Button(action: {
                        loginSuccess = true
                    }) {
                        Text("Log In")
                            .foregroundColor(.black)
                            .italic()
                            .font(.system(size: 20, weight: .bold, design: .serif))
                    }
                    .frame(width: 300, height: 60)
                    .background(LinearGradient(colors: [Color("LoginButtonColor"), .blue.opacity(0.7)], startPoint: .topTrailing, endPoint: .bottomLeading).opacity(validationTextField() ? 0.5 : 1))
                    .cornerRadius(20)
                    .shadow(color: Color("LoginButtonColor"), radius: 4)
                    .disabled(validationTextField())
                    .onAppear { self.didAppear?(self) }
                }.padding(20)
                HStack {
                    Text("Don't Have An Account ?")
                        .foregroundColor(.black.opacity(0.8))
                    Button(action: {
                        
                    }) {
                        Text("Sign Up")
                            .underline()
                            .foregroundColor(.blue.opacity(0.8))
                    }
                }
                HStack {
                    Button(action: {
                        print("Login With FaceBook Account")
                    }) {
                        Image("facebook")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Button(action: {
                        print("Login With Google Account")
                    }) {
                        Image("google")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Button(action: {
                        print("Login With Twitter Account")
                    }) {
                        Image("twitter")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .padding()
        }
    }
}

struct LoginFormBaiTap9App_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormBaiTap9App()
    }
}

struct LoginTextFieldViewModifier: ViewModifier {
    let systemImageString: String
    var isTextFieldPassword: Bool
    @State var isTappingShowPassword: Bool = false
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(
                    LinearGradient(
                        colors: [
                            .red,
                            .blue
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 40)
            HStack {
                Image(systemName: systemImageString)
                content
                if isTextFieldPassword {
                    Button(action: {
                        isTappingShowPassword = !isTappingShowPassword
                    }) {
                        Image(systemName: isTappingShowPassword == true ? "eye.circle" : "eye.slash.circle")
                    }
                }
            }
            .padding()
            .foregroundColor(.gray)
            .shadow(color: .purple, radius: 10)
        }

    }
}

extension View {
    func login(systemImageString: String, isTextFieldPassword: Bool) -> some View {
        ModifiedContent(
            content: self,
            modifier: LoginTextFieldViewModifier(systemImageString: systemImageString, isTextFieldPassword: isTextFieldPassword)
        )
    }
}


struct CheckBoxView: View {
    
    @Binding var checked: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .trim(from: 0, to: 1)
                .fill(checked ? Color.pink : Color.gray.opacity(0.2))
                .frame(width: 20, height: 20)
            if checked {
                Image(systemName: "checkmark.diamond")
                    .foregroundColor(Color.white)
            }
        }
    }
}
