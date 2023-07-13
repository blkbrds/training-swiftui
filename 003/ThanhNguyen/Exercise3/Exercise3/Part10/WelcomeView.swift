//
//  WelcomeView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 10/07/2023.
//

import SwiftUI

struct WelcomeView: View {

    struct WelcomeInfo {
        let title: String
        let subtitle: String
        let imageStr: String
    }

    private let welcomeInfoArray: [WelcomeInfo] = [
        .init(title: "Explore the world easily", subtitle: "To your desire", imageStr: "img_welcome1"),
        .init(title: "Reach the unknown spot", subtitle: "To your destination", imageStr: "img_welcome2"),
        .init(title: "Make connects with Travello", subtitle: "To your dream trip", imageStr: "img_welcome3")
    ]

    @EnvironmentObject var appRouter: AppRouter

    @State var currentPage: Int = 0

    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(welcomeInfoArray[currentPage].imageStr)
                    .resizable()
                    .frame(width: geo.size.width * 2 / 3, height: geo.size.height / 3)
                VStack {
                    Text(welcomeInfoArray[currentPage].title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.system(size: 50, weight: .bold))
                        .padding(.top, 100)
                        .padding(.leading)
                    Text(welcomeInfoArray[currentPage].subtitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .font(.system(size: 30, weight: .light))
                        .padding(.leading)
                }
                HStack {
                    ForEach(Array(welcomeInfoArray.enumerated()), id: \.offset) { index, info in
                        RoundedRectangle(cornerRadius: .infinity)
                            .frame(width: 20, height: 10)
                            .foregroundColor(index == currentPage ? Color("backgroundPink") : Color("disablePink"))
                    }
                    Spacer()
                    Button(">") {
                        if currentPage < welcomeInfoArray.count - 1 {
                            self.currentPage += 1
                        } else {
                            appRouter.state = .login
                        }
                    }
                    .frame(width: 60, height: 60)
                    .background(.black)
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .black, design: .serif))
                    .cornerRadius(.infinity)
                }
                .padding(.top, 60)
                .padding([.leading, .trailing])
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
