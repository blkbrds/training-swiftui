//
//  ForgotPasswordView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/05/2023.
//

import SwiftUI

struct ForgotPasswordView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var email: String = ""

    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .frame(width: 200)
                    .foregroundColor(Color("green"))
                    .opacity(0.3)

                Image("lock")
                    .resizable()
                    .frame(width: 120, height: 120)
            }
                .padding(.vertical, 40)

            VStack {
                Text("Please enter your email address to")
                    .font(.system(size: 20, weight: .medium))

                Text("receive a verification card")
                    .font(.system(size: 20, weight: .medium))
            }

            InputCell(value: $email, type: .email)

            Text("Try another way")
                .foregroundColor(.orange)
                .underline()
                .padding(.top, 40)

            Spacer()
            NavigationLink(destination:
                    VerifyEmailView()
                , label: {
                    Text("Send")
                        .frame(width: Define.widthButton, height: Define.heightButton)
                        .myButtonModifier()
                })
                .disabled(!email.validateEmail())
        }
            .navigationTitle("Forgot Password")
            .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }
                    , label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black)
                    })
            }
        }
            .navigationBarBackButtonHidden(true)
            .padding(.horizontal, 25)
            .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
