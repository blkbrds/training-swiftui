//
//  WelcomeScreen2View.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct WelcomeScreen2View: View {
    @EnvironmentObject var appRouter: AppRouter
    @State var imageTutorial: String = TextOfScreenWelcome.imageFavorite
    @State var titleTextTutorial: String = TextOfScreenWelcome.titleFavorite
    @State var contentTextTutorial: String = TextOfScreenWelcome.contentFavorite
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
                            imageTutorial = TextOfScreenWelcome.imageDelivery
                            titleTextTutorial = TextOfScreenWelcome.titleDelivery
                        contentTextTutorial =
                            TextOfScreenWelcome.contentDelivery
                        }
                        else if currentPage == 2 {
                            imageTutorial = TextOfScreenWelcome.imageChoiceFood
                            titleTextTutorial = TextOfScreenWelcome.titleChoiceFood
                            contentTextTutorial = TextOfScreenWelcome.contentChoiceFood
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

struct WelcomeScreen2View_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen2View(imageTutorial: TextOfScreenWelcome.imageFavorite, titleTextTutorial: TextOfScreenWelcome.titleFavorite, contentTextTutorial: TextOfScreenWelcome.contentFavorite, currentPage: 0)
    }
}

struct TextOfScreenWelcome {
    static let imageIntrodule: String = "manWithCream"
    static let titleIntrodule: String = "Welcome"
    static let contentIntrodule: String = "It’s a pleasure to meet you. We are excited that you’re here so let’s get started!"
    static let imageFavorite: String = "pizza_icon_welcome"
    static let titleFavorite: String = "All your favorites"
    static let contentFavorite: String = "Order from the best local restaurants win easy, on-demand delivery"
    static let imageDelivery: String = "delivery_img_welcome"
    static let titleDelivery: String = "Free delivery offers"
    static let contentDelivery: String = "Free delivery for new customers via Apple Pay and others payment methods"
    static let imageChoiceFood: String = "chooseFood_img_welcome"
    static let titleChoiceFood: String = "Choose your food"
    static let contentChoiceFood: String = "Easily find your type of food craving and you'll get delivery in wide range"
}
