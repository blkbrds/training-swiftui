//
//  TutorialView.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 11/04/2023.
//

import SwiftUI

struct TutorialView: View {

    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @EnvironmentObject var appRouter: AppRouter

    var body: some View {

        TabView {
            Image("tutorial1")
                .resizable()
                .scaleEffect(1.02)
                .ignoresSafeArea()
                .tag(1)

            Image("tutorial2")
                .resizable()
                .scaleEffect(1.02)
                .ignoresSafeArea()
                .tag(1)

            Image("tutorial3")
                .resizable()
                .scaleEffect(1.02)
                .ignoresSafeArea()
                .tag(0)
        }
            .ignoresSafeArea(.all)
            .tabViewStyle(PageTabViewStyle())
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
