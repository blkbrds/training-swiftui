//
//  WelcomeViewBaiTap10App.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/12/23.
//

import SwiftUI

struct WelcomeViewBaiTap10App: View {
    
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        ZStack {
            Image("helloStar")
                .resizable()
            VStack(alignment: .center) {
                Image("WelcomeScreenImage")
                    .resizable()
                    .frame(width: 200, height: 300)
                    .padding()
                Text("Woohoo")
                    .font(.system(size: 40, weight: .bold, design: .serif))
                    .foregroundColor(.gray)
                    .shadow(radius: 3)
                Text("Choose Your Love, \nReady for your life")
                    .font(.system(size: 15, weight: .bold, design: .serif))
                    .foregroundColor(.white.opacity(0.7))
                Button(action: {
                    appRouter.state = .login
                }) {
                    Text("Let's Go")
                        .foregroundColor(.black)
                        .italic()
                        .font(.system(size: 20, weight: .bold, design: .serif))
                }
                .frame(width: 300, height: 60)
                .background(LinearGradient(colors: [Color("LoginButtonColor"), .blue.opacity(0.7)], startPoint: .topTrailing, endPoint: .bottomLeading)
                )
                .cornerRadius(20)
                .shadow(color: Color("LoginButtonColor"), radius: 4)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(colors: [.white, .gray.opacity(0.7)], startPoint: .topTrailing, endPoint: .bottomLeading))
    }
}

struct WelcomeViewBaiTap10App_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeViewBaiTap10App()
    }
}

