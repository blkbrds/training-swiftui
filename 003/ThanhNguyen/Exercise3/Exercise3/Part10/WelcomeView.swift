//
//  WelcomeView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 10/07/2023.
//

import SwiftUI

struct WelcomeView: View {

    @EnvironmentObject var appRouter: AppRouter
    let numberOfPage: Int = 3
    @State var title: String = "Explore the world easily"
    @State var subtitle: String = "To your desire"
    @State var imageName: String = "img_welcome1"
    @State var currentPage: Int = 0

    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: geo.size.width * 2 / 3, height: geo.size.height / 3)
                VStack {
                    Text(title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.system(size: 50, weight: .bold))
                        .padding(.top, 100)
                        .padding(.leading)
                    Text(subtitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .font(.system(size: 30, weight: .light))
                        .padding(.leading)
                }
                HStack {
                    ForEach(0..<numberOfPage, id: \.self) { i in
                        RoundedRectangle(cornerRadius: .infinity)
                            .frame(width: 20, height: 10)
                            .foregroundColor(i == currentPage ? Color("backgroundPink") : Color("disablePink"))
                    }
                    Spacer()
                    Button(">") {
                        if currentPage < numberOfPage - 1 {
                            self.currentPage += 1
                            if currentPage == 1 {
                                title = "Reach the unknown spot"
                                subtitle = "To your destination"
                                imageName = "img_welcome2"
                            } else if currentPage == 2 {
                                title = "Make connects with Travello"
                                subtitle = "To your dream trip"
                                imageName = "img_welcome3"
                            }
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
