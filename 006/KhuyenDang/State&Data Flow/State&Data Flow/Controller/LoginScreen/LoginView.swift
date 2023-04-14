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
    @State var isLoading: Bool = false
    @StateObject var viewModel = LoginViewModel()

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

                    TextFieldView(data: $viewModel.username, type: .userName)
                    TextFieldView(data: $viewModel.password, type: .password)

                    HStack {
                        otherInformation(infor: "Forgot Password?", action: "Click here")
                            .padding(.leading, 20)
                        Spacer()
                    }

                    HStack {
                        Button(action: {
                            Task {
                                isLoading = true
                                await viewModel.isValidAccount()
                                if viewModel.isLoginSuccess {
                                    appRouter.state = .home
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
                            .disabled(viewModel.username.isEmpty || viewModel.password.isEmpty)
                            .alert(isPresented: $viewModel.isShowErrorAlert) {
                            Alert(title: Text(viewModel.contentAlert.0), message: Text(viewModel.contentAlert.1))
                        }

                        Button(action: {
                            viewModel.username = ""
                            viewModel.password = ""
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
