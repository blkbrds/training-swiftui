//
//  LoginView.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 08/05/2023.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()
    @State var isShowIndicator: Bool = false
    @EnvironmentObject var appRouter: StorageData
    @State var logoScale = 0.0
    @State var opacityTitle = 0.0
    @State var isShowPopUp = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 62, height: 65)
                        .scaleEffect(logoScale)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1)) {
                                logoScale = 1.0
                            }
                        }
                    
                    Text("Login")
                        .font(.system(size: 32, weight: .bold))
                        .opacity(opacityTitle)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1).delay(1.0)) {
                                opacityTitle = 1.0
                            }
                        }
                    if delay() {
                        VStack(alignment: .leading, spacing: 10) {
                            TextField("Email Address", text: $viewModel.email)
                                .padding()
                                .overlay {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.black, lineWidth: 1)
                                }
                                .autocapitalization(.none)
                                .padding(.horizontal)
                            
                            if !viewModel.email.isValidEmail() && viewModel.email != "" {
                                ErrorView(imageName: ErrorType.wrong.getImageError(), messageError: "Email invalidate")
                                    .padding(.leading, 15)
                            }
                            
                            ZStack(alignment: .trailing) {
                                securedTextField
                                    .autocapitalization(.none)
                                
                                Button(action: {
                                    viewModel.isShowPassword.toggle()
                                }, label: {
                                    Image(systemName: viewModel.isShowPassword ? "eye.slash" : "eye")
                                        .accentColor(.gray)
                                        .padding(.horizontal)
                                        .padding(.horizontal, 5)
                                })
                            }
                            
                            NavigationLink(
                                destination: ForgotPasswordView(shouldPopToRootView: $viewModel.forgotPasswordFlow).navigationBarBackButtonHidden(true),
                                isActive: $viewModel.forgotPasswordFlow
                            ) {
                                Text("Forgot Password?")
                                    .font(.system(size: 17, weight: .bold))
                                    .padding(.horizontal)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        .animation(Animation.default.delay(delay() ? 2 : 0))
                        .transition(.slide)
                        
                        VStack {
                            Button {
                                Task {
                                    isShowIndicator = true
                                    let data = await viewModel.checkLogin()
                                    if viewModel.loginSuccess {
                                        appRouter.appState = .main
                                        appRouter.dataLogin = try JSONEncoder().encode(data)
                                    } else {
                                        isShowPopUp = true
                                    }
                                    isShowIndicator = false
                                }
                            } label: {
                                Text("Login")
                                    .frame(maxWidth: .infinity)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 17)
                            }
                            .cornerRadius(10)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [
                                            Color(red: 2 / 255, green: 91 / 255, blue: 242 / 255),
                                            Color(red: 11 / 255, green: 218 / 255, blue: 254 / 255)
                                        ]), startPoint: .topTrailing, endPoint: .bottomLeading)
                                    )
                                    .scaleEffect(x: viewModel.isLoginDisable() ? 1 : 0, y: 1)
                            }
                            .background(.gray)
                            .disabled(!viewModel.isLoginDisable())
                            .cornerRadius(10)
                            .padding()
                            .alert(isPresented: $isShowPopUp) {
                                viewModel.errorType.errorAlert()
                            }
                            
                            HStack {
                                line
                                Text("or continue with ")
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                line
                            }

                            typeLogin
                            
                            VStack(spacing: 10) {
                                Text("Do you already have an account?")
                                    .fontWeight(.heavy)

                                NavigationLink(
                                    destination: RegisterView(rootIsActive: $viewModel.registerFlow),
                                    isActive: $viewModel.registerFlow
                                ) {
                                    Text("Sign up")
                                        .fontWeight(.heavy)
                                        .underline()
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.top, 30)
                        }
                        .animation(Animation.default.delay(delay() ? 2 : 0))
                        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity).animation(Animation.default.delay(delay() ? 2 : 0)))
                    }
                }
                .blur(radius: isShowIndicator ? 2 : 0)
                
                ActivityIndicator(isAnimating: isShowIndicator, style: .large)
            }
        }
    }
    
    var securedTextField: some View {
        ZStack {
            TextField("Password", text: $viewModel.password)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                }
                .padding(.horizontal)
                .opacity(viewModel.isShowPassword ? 1 : 0)
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                }
                .padding(.horizontal)
                .opacity(viewModel.isShowPassword ? 0 : 1)
        }
    }
    
    var line: some View {
        VStack { Divider().background(Color.black) }.padding(10)
    }
    
    var typeLogin: some View {
        HStack(spacing: 10) {
            TypeLoginButtonView(imageName: "facebook")
            TypeLoginButtonView(imageName: "google")
            TypeLoginButtonView(imageName: "apple")
        }
    }
    
    func delay() -> Bool {
        return opacityTitle == 1.0
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct TypeLoginButtonView: View {

    var imageName: String

    var body: some View {
        Button {
            print("")
        } label: {
            Image(imageName)
                .resizable()
                .frame(width: 17, height: 18)
        }
        .padding()
        .padding(.horizontal, 30)
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.black, lineWidth: 1)
        }
    }
}

struct ActivityIndicator: UIViewRepresentable {

    var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
