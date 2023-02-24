//
//  WelcomeScreen.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 24/02/2023.
//

import SwiftUI

struct WelcomeScreen: View {
    
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        VStack {
            NameBear()
            Spacer()
            Image("bear_welcome")
                .resizable()
                .frame(width: 400, height: 250)
                .padding(.bottom, 40)
            
            Button(action: {
                appRouter.state = .login
            }
                , label:
                {
                    Text("START DISCOVERING BEAR")
                })
                .buttonModifier()
                .padding(.top, 10)
            Spacer()
            Text("By continue you agree to our")
                .foregroundColor(Color(red: 0.345, green: 0.325, blue: 0.309))
            Text("Term & Privacy Policy")
                .bold()
                .foregroundColor(Color(red: 0.345, green: 0.325, blue: 0.309))
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
