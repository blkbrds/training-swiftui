//
//  WelcomeView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 30/06/2023.
//

import SwiftUI

struct WelcomeView: View {

    @EnvironmentObject var coordinator: Coordinator

    var numberOfPages: Int = 3
    @State var currentPage: Int = 3
    var body: some View {
        VStack {
            let imageWidth: CGFloat = UIScreen.main.bounds.width - 60
            Image("img-welcome")
                .resizable()
                .frame(width: imageWidth, height: imageWidth * 294 / 316)
            Text("Text, Audio and Video Chat")
                .appColorTitleTextLoginModifier()
                .multilineTextAlignment(.center)
                .frame(width: 224)
            ZStack {
            }.frame(height: 20)
            VStack(spacing: 40) {
                Text("Intuitive real life experience on mobile. Chat with fellow gamers before and after combat for free!")
                    .normalTextLoginModifier()
                    .multilineTextAlignment(.center)
                    .frame(width: 224)
                Button {
                    coordinator.setScreenType(screenType: .login)
                } label: {
                    Text("Let's Combat!")
                        .loginButtonTextModifier()
                }
                .loginButtonModifier()
                .cornerRadius(29)
                .frame(width: 224, height: 58)
                HStack {
                    ForEach(0..<numberOfPages) { index in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(index + 1 == self.currentPage ? Color(Define.loginTintColor) : Color(Define.loginBlurTintColor))
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

