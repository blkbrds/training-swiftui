//
//  LoginView.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 03/04/2023.
//

import SwiftUI

func nameBear() -> HStack<TupleView<(Text, Text)>> {
    return HStack {
        Text("bear")
            .font(.system(size: 65, weight: .bold))
            .foregroundColor(Color("bearColor"))
        Text(".")
            .font(.system(size: 62, weight: .bold))
    }
}

fileprivate func otherInformation(infor: String, action: String) -> HStack<TupleView<(Text, Text)>> {
    return HStack {
        Text(infor)
            .foregroundColor(Color(red: 0.345, green: 0.325, blue: 0.309))
        Text(action)
            .bold()
            .foregroundColor(Color(red: 0.345, green: 0.325, blue: 0.309))
    }
}

enum Login {
    case success
    case fail
}

struct LoginView: View {

    @StateObject var model = LoginModel()
    @State var username: String = ""
    @State var password: String = ""
    @State var isLogin: Login?
    @State var isLoading: Bool = true

    var body: some View {

        NavigationStack {
            ZStack {
                VStack {
                    nameBear()

                    Text("Log in on bear :)")
                        .font(.system(size: 30, weight: .light))

                    Image("bear_login")
                        .padding(.top)
                        .padding(.bottom)

                    TextFieldView(data: $username, type: .userName)
                    TextFieldView(data: $password, type: .password)

                    HStack {
                        otherInformation(infor: "Forgot Password?", action: "Click here")
                            .padding(.leading, 20)
                        Spacer()
                    }

                    HStack {
                        Button(action: {
                            Task {
                                if await model.isValidAccount(username: username, password: password) {
                                    isLogin = .success
                                } else {
                                    isLogin = .fail
                                }
                            }
                        }
                            , label: {
                                Text("LOGIN")
                            })
                            .frame(width: UIScreen.main.bounds.width / 2 - 60)
                            .myButtonModifier()
                            .padding(.top)
                            .disabled(username.isEmpty || password.isEmpty)
                            .alert(isPresented: Binding<Bool>(
                            get: { self.isLogin == .fail },
                            set: { _ in
                                self.isLogin = .none
                            }
                            )) {
                            Alert(title: Text("Login Failed"), message: Text("Invalid username or password"))
                        }
                            .navigationDestination(isPresented: Binding<Bool>(
                            get: { self.isLogin == .success },
                            set: { _ in }
                            )) {
                            HomeView()
                                    .navigationBarBackButtonHidden(true)
                        }

                        Button(action: {
                            username = ""
                            password = ""
                        }
                            , label: {
                                Text("Cancel")
                            })
                            .frame(width: UIScreen.main.bounds.width / 2 - 60)
                            .font(.system(size: 24))
                            .foregroundColor(Color("bearColor"))
                            .padding(.all)
                            .cornerRadius(30)
                            .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color(red: 0.683, green: 0.597, blue: 0.501), lineWidth: 1)
                        )
                            .padding(.top)
                    }
                    Spacer()
                    otherInformation(infor: "Didn't have an account?", action: "Sign Up")
                }

                if model.isLoading {
                    ProgressView()
                        .scaleEffect(2.0)
                        .tint(.brown)
                }
            }
        }
        .disabled(model.isLoading)
        .onTapGesture {
            self.endEditing()
        }
    }
    
    private func endEditing() {
           UIApplication.shared.endEditing()
       }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
