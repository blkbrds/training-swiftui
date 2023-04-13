//
//  LoginView.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 03/04/2023.
//

import SwiftUI

func green() -> HStack<TupleView<(Text, Text)>> {
    return HStack {
        Text("green")
            .font(.system(size: 65, weight: .bold))
            .foregroundColor(Color("primaryColor"))
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

struct LoginView: View {

    @EnvironmentObject var appRouter: AppRouter
    @ObservedObject var dataManager = DataManager()
    @EnvironmentObject var account: Account
    @State var username: String = ""
    @State var password: String = ""
    @State var isShowErrorAlert: Bool = false
    @State var isLoading: Bool = false
    private var localStorage = LocalStorage()
    @State var contentAlert: (String, String) = ("", "")

    var body: some View {

        NavigationStack {
            ZStack {
                VStack {
                    green()

                    Text("Log in on green :)")
                        .font(.system(size: 30, weight: .light))

                    Image("tree")
                        .resizable()
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
                                isLoading = true
                                do {
                                    if try await dataManager.isValidAccount(username: username, password: password) {
                                        guard let newAccount = dataManager.account else { return }
                                        localStorage.setUser(fullname: newAccount.fullname ?? "", age: newAccount.age ?? 0, address: newAccount.address ?? "")
                                        self.account.setUser(fullname: newAccount.fullname ?? "", age: newAccount.age ?? 0, address: newAccount.address ?? "")
                                        appRouter.state = .home
                                    } else {
                                        contentAlert = ("Login Failed", "Invalid username or password")
                                        isShowErrorAlert = true
                                    }
                                } catch {
                                    contentAlert = ("Request Failed", "We can't connect to server")
                                    isShowErrorAlert = true
                                }
                                isLoading = false
                            }
                        }
                            , label: {
                                Text("LOGIN")
                                    .padding(.all)
                                    .frame(width: UIScreen.main.bounds.width / 2 - 30)
                            })

                            .myButtonModifier()
                            .padding(.top)
                            .disabled(username.isEmpty || password.isEmpty)
                            .alert(isPresented: $isShowErrorAlert) {
                                Alert(title: Text(contentAlert.0), message: Text(contentAlert.1))
                        }

                        Button(action: {
                            username = ""
                            password = ""
                        }
                            , label: {
                                Text("Cancel")
                                    .padding(.all)
                                    .frame(width: UIScreen.main.bounds.width / 2 - 30)
                            })
                            .font(.system(size: 24))
                            .foregroundColor(Color("primaryColor"))
                            .cornerRadius(30)
                            .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("primaryColor"), lineWidth: 1)
                        )
                            .padding(.top)
                    }
                    Spacer()
                    otherInformation(infor: "Didn't have an account?", action: "Sign Up")
                }

                if isLoading {
                    ProgressView()
                        .scaleEffect(3.0)
                        .tint(Color("primaryColor"))
                }
            }
        }
            .disabled(isLoading)
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
