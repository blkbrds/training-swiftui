//
//  LaunchView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 17/05/2023.
//

import SwiftUI

struct LaunchView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @EnvironmentObject var appRouter: AppRouter
    @State var isShowMainView: Bool = false
    @State var size = 0.7
    @State var opacity = 0.5
    private var localStorage = LocalStorage()

    var body: some View {
        ZStack {
            Color("green")
            Image("launch")
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.isShowMainView = true
            }
        }
            .onChange(of: isShowMainView) { newValue in
            if isFirstLaunch {
                appRouter.state = .tutorial
            } else {
                if !localStorage.email.isEmpty && !localStorage.password.isEmpty {
                    appRouter.state = .tabbar
                } else {
                    appRouter.state = .login
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
