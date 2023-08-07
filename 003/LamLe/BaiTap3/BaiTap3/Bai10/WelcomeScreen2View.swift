//
//  WelcomeScreen2View.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI



struct WelcomeScreen2View: View {
    @EnvironmentObject var appRouter: AppRouter
    let numberOfPage: Int = 3
    @State var currentPage: Int = 0
    @StateObject private var viewModel = WelcomeViewViewModel()

    var body: some View {
        ZStack {
            VStack {
                TopWelcomeView()
                Image(viewModel.getInfoTutorial(page: currentPage).imageTutorial)
                    .resizable()
                    .frame(width: 299, height: 299)
                Text(viewModel.getInfoTutorial(page: currentPage).titleTextTutorial)
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
                Text(viewModel.getInfoTutorial(page: currentPage).contentTextTutorial)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .offset(x: 10)
                    .frame(width: 327, height: 72)
                    .font(.system(size: 16, weight: .regular, design: .serif))
                HStack {
                    ForEach(0..<numberOfPage, id: \.self) { i in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(i == currentPage ? Color(.white) : Color(.black))
                            .transition(AnyTransition.opacity.combined(with: .scale))
                    }
                }
                Button(action: {
                    if currentPage < numberOfPage - 1  {
                        self.currentPage+=1
                    } else {
                        appRouter.state = .login
                    }
                }) {
                    Text(currentPage == 2 ? "Login" : "Next")
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

struct WelcomeScreen2View_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen2View(currentPage: 0)
    }
}
