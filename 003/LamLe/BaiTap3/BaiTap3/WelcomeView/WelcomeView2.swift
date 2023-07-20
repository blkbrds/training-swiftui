//
//  WelcomeView2App.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/14/23.
//

import SwiftUI

struct WelcomeView2App: View {
    @EnvironmentObject var appRouter: AppRouter
    @State var imageTutorial: String = "pizza_icon_welcome"
    @State var titleTextTutorial: String = "All your favorites"
    @State var contentTextTutorial: String = "Order from the best local restaurants win easy, on-demand delivery"
    let numberOfPage: Int = 3
    @State var currentPage: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                TopViewWelcome()
                Image(imageTutorial)
                    .resizable()
                    .frame(width: 299, height: 299)
                Text(titleTextTutorial)
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
                Text(contentTextTutorial)
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
                        if currentPage == 1 {
                            imageTutorial = "delivery_img_welcome"
                        titleTextTutorial = "Free delivery offers"
                        contentTextTutorial = "Free delivery for new customers via Apple Pay and others payment methods"
                        }
                        else if currentPage == 2 {
                        imageTutorial = "chooseFood_img_welcome"
                        titleTextTutorial = "Choose your food"
                        contentTextTutorial = "Easily find your type of food craving and you'll get delivery in wide range"
                        }
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

struct WelcomeView2App_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView2App(imageTutorial: "pizza_icon_welcome", titleTextTutorial: "All your favorites", contentTextTutorial: "Order from the best local restaurants win easy, on-demand delivery", currentPage: 0)
    }
}
