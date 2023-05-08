//
//  VerifyEmailView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

struct VerifyEmailView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var email: String = ""
    @State var optCode: String = ""
    @State var optCodeLength: Int = 6

    var body: some View {

        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .frame(width: 200)
                    .foregroundColor(Color("green"))
                    .opacity(0.3)

                Image("email")
                    .resizable()
                    .frame(width: 120, height: 120)
            }
                .padding(.vertical, 40)

            VStack {
                Text("Please enter the \(optCodeLength) digit code send to")
                    .font(.system(size: 20, weight: .medium))

                Text("receive a verification card")
                    .font(.system(size: 20, weight: .medium))
            }

            EnterDigitCodeView(otpCode: $optCode, otpCodeLength: $optCodeLength)
                .padding(.vertical, 40)
            Text("Resend code")
                .foregroundColor(.orange)
                .underline()

            Spacer()
            NavigationLink(destination:
                    CreateNewPasswordView()
                , label: {
                    Text("Verify")
                        .myButtonModifier()
                })
                .disabled(optCode.count < optCodeLength)
        }
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
            .navigationTitle("Verify your email")
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

struct VerifyEmailView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyEmailView()
    }
}
