//
//  CreateNewPasswordView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/05/2023.
//

import SwiftUI

struct CreateNewPasswordView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var newPassword: String = ""
    @State var confirmPassword: String = ""

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 20) {
                ZStack {
                    Circle()
                        .frame(width: 200)
                        .foregroundColor(Color("green"))
                        .opacity(0.3)

                    Image("unlock")
                        .resizable()
                        .frame(width: 120, height: 120)
                }
                    .padding(.vertical, 40)

                VStack {
                    Text("Your new password must be different")
                        .font(.system(size: 20, weight: .medium))

                    Text("from previous used password")
                        .font(.system(size: 20, weight: .medium))
                }

                InputCell(value: $newPassword, type: .password)
                InputCell(value: $confirmPassword, type: .confirmPassword)

                Spacer()
                Button(action: { },
                    label: {
                        Text("Save")
                            .myButtonModifier()
                    })
                    .disabled(newPassword.isEmpty || confirmPassword.isEmpty)
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
}

struct CreateNewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPasswordView()
    }
}
