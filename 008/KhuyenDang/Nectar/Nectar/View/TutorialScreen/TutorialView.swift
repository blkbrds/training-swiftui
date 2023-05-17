//
//  TutorialView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 17/05/2023.
//

import SwiftUI

struct TutorialView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @EnvironmentObject var appRouter: AppRouter

    var body: some View {
        ZStack(alignment: .bottom) {
            Image("tutorial")
                .resizable()
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Image("carrot_white")
                Text("Welcome \nto our store")
                    .font(.system(size: 48, weight: .semibold))
                    .foregroundColor(.white)
                Text("Get your groceries in as fast as one our")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                Button(action: {
                    appRouter.state = .login
                }, label: {
                        Text("Get Started")
                            .frame(width: Define.widthButton, height: Define.heightButton)
                            .myButtonModifier()
                    })
            }
                .padding(.bottom, 80)
        }
            .onAppear {
            isFirstLaunch = false
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
