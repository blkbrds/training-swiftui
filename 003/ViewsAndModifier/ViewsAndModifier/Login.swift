//
//  Login.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/02/2023.
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

struct Login: View {

    @State var username: String = ""
    @State var password: String = ""

    fileprivate func otherInformation(infor: String, action: String) -> HStack<TupleView<(Text, Text)>> {
        return HStack {
            Text(infor)
                .foregroundColor(Color(red: 0.345, green: 0.325, blue: 0.309))
            Text(action)
                .bold()
                .foregroundColor(Color(red: 0.345, green: 0.325, blue: 0.309))
        }
    }
    
    var body: some View {
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
                Button(action: { }
                    , label: {
                        Text("LOGIN")
                    })
                    .frame(width: UIScreen.main.bounds.width / 2 - 60)
                    .myButtonModifier()
                    .padding(.top)
                    .disabled(username.isEmpty || password.isEmpty)

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
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
