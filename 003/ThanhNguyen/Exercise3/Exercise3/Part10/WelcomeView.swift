//
//  WelcomeView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 10/07/2023.
//

import SwiftUI

struct WelcomeView: View {

    @EnvironmentObject var appRouter: AppRouter

    var body: some View {
        VStack {
            Image("img_welcome")
                .resizable()
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: .infinity)
                    .stroke(.white, lineWidth: 2)
                    .frame(height: 50)
                    .padding()
                Button {
                    appRouter.state = .login
                } label: {
                    Text("Go to Login screen")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
            }
            Spacer()
        }
        .background(.black)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
