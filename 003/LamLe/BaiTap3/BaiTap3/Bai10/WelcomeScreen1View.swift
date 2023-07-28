//
//  WelcomeScreen1View.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct WelcomeScreen1View: View {
    @EnvironmentObject var appRouter: AppRouter
    @StateObject private var viewModel = WelcomeViewViewModel()

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 437, height: 437)
                .foregroundColor(Color(red: 254/255, green: 249/255, blue: 237/255))
                .position(x: 80, y: 100)
            VStack(alignment: .center) {
                TopWelcomeView()
                Image(viewModel.getImageTutorial(page: 3))
                    .resizable()
                    .frame(width: 299, height: 299)
                Text(viewModel.getTitleTextTutorial(page: 3))
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
                Text(viewModel.getContentTextTutorial(page: 3))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .offset(x: 10)
                    .frame(width: 327, height: 72)
                    .font(.system(size: 16, weight: .regular, design: .serif))
                Button(action: {
                    appRouter.state = .welcome
                }) {
                    Text("Let's Go")
                        .foregroundColor(.black)
                        .italic()
                        .font(.system(size: 20, weight: .bold, design: .serif))
                }
                .buttonLoginModifier()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(colors: [.white, .gray.opacity(0.7)], startPoint: .topTrailing, endPoint: .bottomLeading))

    }
}

struct WelcomeScreen1View_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen1View()
    }
}
