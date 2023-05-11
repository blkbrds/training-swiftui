//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 30/03/2023.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()
    @EnvironmentObject var appRouter: StorageData
    @State var isShowIndicator: Bool = false

    var body: some View {
        ZStack {
            VStack {
                Text("Login")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                Text("Welcome to my app")
                    .foregroundColor(Color.red)
                    .padding()
                
                VStack {
                    InputLoginView(email: $viewModel.email, password: $viewModel.password)
                    HStack {
                        Spacer()
                        Text("Forgot Password")
                            .font(.system(size: 17, weight: .bold))
                    }
                    
                    Button {
                        Task {
                            isShowIndicator = true
                            let data = await viewModel.handleLogin()
                            if let data = data {
                                appRouter.dataLogin = data
                                appRouter.appState = .home
                            }
                            self.isShowIndicator = false
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                            Text("Login")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(height: 50)
                    .padding(.top, 30)
                    .disabled((viewModel.email == "") || (viewModel.password == "") || !viewModel.email.isOpacity())
                    .alert(isPresented: $viewModel.isShowAlert) {
                        Alert(title: Text(viewModel.titleError), message: Text(viewModel.contentError), dismissButton: .default(Text("Ok")))
                    }

                }
                .padding(.horizontal, 30)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.75)
                .background(Color.white.clipShape(CustomShape()))
                .disabled(isShowIndicator)
                .blur(radius: isShowIndicator ? 3 : 0)
                
                Spacer()
            }
            
            ActivityIndicator(isAnimating: isShowIndicator, style: .large)
        }
        .background(Image("backgroundImage").resizable().ignoresSafeArea(.all))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 0))
            path.addQuadCurve(to: CGPoint(x: rect.width - 80, y: 40), control: CGPoint(x: rect.width - 15, y: 45))
            path.addLine(to: CGPoint(x: 80, y: 40))
            path.addQuadCurve(to: CGPoint(x: 0, y: 80), control: CGPoint(x: 15, y: 40))
            

            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addQuadCurve(to: CGPoint(x: 80, y: rect.height - 40), control: CGPoint(x: 15, y: rect.height - 40))
            path.addLine(to: CGPoint(x: rect.width - 80, y: rect.height - 40))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height - 80), control: CGPoint(x: rect.width - 15, y: rect.height - 35))
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

struct InputLoginView: View {

    @Binding var email: String
    @Binding var password: String
    @State var isShowPassword: Bool = false

    var body: some View {
        VStack(spacing: email.isOpacity() ? 0 : 20) {
            VStack(alignment: .leading) {
                Text("Email Address")
                    .font(.system(size: 17, weight: .bold))
                TextField("Enter your email", text: $email)
                    .padding()
                    .textInputAutocapitalization(.never)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.orange, lineWidth: 2)
                    }
                Text("Email không đúng định dạng")
                    .foregroundColor(.red)
                    .opacity(email.isOpacity() ? 0 : 1)
            }
            
            VStack(alignment: .leading) {
                Text("Password")
                    .font(.system(size: 17, weight: .bold))
                ZStack(alignment: .trailing) {
                    if isShowPassword {
                        TextField("Enter your Password", text: $password)
                            .padding()
                            .textInputAutocapitalization(.never)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.orange, lineWidth: 2)
                            }
                    } else {
                        SecureField("Enter your Password", text: $password)
                            .padding()
                            .textInputAutocapitalization(.never)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.orange, lineWidth: 2)
                            }
                    }
                    
                    Button {
                        isShowPassword = !isShowPassword
                    } label: {
                        Image(systemName: isShowPassword ? "eye.slash" : "eye")
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 5)

                }
            }
        }
    }
}
