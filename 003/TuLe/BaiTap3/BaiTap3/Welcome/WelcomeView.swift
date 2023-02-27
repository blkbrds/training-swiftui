//
//  WelcomeView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 21/02/2023.
//

import SwiftUI

struct WelcomeView: View {

    @EnvironmentObject var appRouter: AppRouter

    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .foregroundColor(.orange)
                .frame(width: 50, height: 50)
            Text("Hello, welcome to swiftUI")
                .padding()
                .font(.title3)
            Button{
                appRouter.state = .login
            } label: {
                Text("Start")
                    .padding()
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 10)
            .background(.blue)
        .clipShape(Capsule())
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
