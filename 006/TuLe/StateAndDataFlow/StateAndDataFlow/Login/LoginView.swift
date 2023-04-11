//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 30/03/2023.
//

import SwiftUI

struct LoginView: View {

    @State var email: String = ""
    @State var password: String = ""
    @State var isShowIndicator: Bool = false
    @State var isShowAlert: Bool = false
    @EnvironmentObject var appRouter: AppRouter
    var model = DataManager()

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
                    InputLoginView(email: $email, password: $password)
                    HStack {
                        Spacer()
                        Text("Forgot Password")
                            .font(.system(size: 17, weight: .bold))
                    }
                    
                    Button {
                        handleLogin()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                            Text("Login")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(height: 50)
                    .padding(.top, 30)
                    .disabled((email == "") || (password == "") || !email.isOpacity())
                    .alert(isPresented: $isShowAlert) {
                        Alert(title: Text("Đăng nhập thất bại"), message: Text("Email hoặc mật khẩu không đúng"), dismissButton: .default(Text("Ok")))
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
    
    private func handleLogin() {
        Task {
            do {
                isShowIndicator = true
                let isLogin = try await model.loadData(value: User(email: email, password: password))
                isShowIndicator = false
                if isLogin {
                    appRouter.state = .home
                } else {
                    isShowAlert = true
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

    var body: some View {
        VStack(spacing: email.isOpacity() ? 0 : 20) {
            VStack(alignment: .leading) {
                Text("Email Address")
                    .font(.system(size: 17, weight: .bold))
                TextField("Enter your email", text: $email)
                    .padding()
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
                TextField("Enter your Password", text: $password)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.orange, lineWidth: 2)
                    }
            }
        }
    }
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    func isOpacity() -> Bool {
        if self != "" {
            return self.isValidEmail()
        } else {
            return true
        }
    }
}
