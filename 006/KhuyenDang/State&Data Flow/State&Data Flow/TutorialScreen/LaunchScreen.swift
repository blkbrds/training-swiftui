//
//  LaunchScreen.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 11/04/2023.
//

import SwiftUI

struct LaunchScreen: View {

    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @EnvironmentObject var appRouter: AppRouter
    @State var isShowMainView: Bool = false
    @State var size = 0.7
    @State var opacity = 0.5

    var body: some View {
        ZStack {
            Color(red: 0.26666666666666666, green: 0.4392156862745098, blue: 0.3333333333333333)
            Image("GOGREEN")
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 1.0
                    self.opacity = 1.0
                }
            }
        }
            .ignoresSafeArea()
            .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.isShowMainView = true
            }
        }
            .onChange(of: isShowMainView) { newValue in
            if isFirstLaunch, newValue {
                appRouter.state = .tutorial
            } else {
                appRouter.state = .login
            }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
