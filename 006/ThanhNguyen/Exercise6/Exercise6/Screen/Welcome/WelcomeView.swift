//
//  WelcomeView.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 24/08/2023.
//

import SwiftUI

struct WelcomeView: View {

    @EnvironmentObject var appRouter: AppRouter
    @StateObject var viewModel: WelcomeViewModel = .init()

    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(viewModel.welcomeData.imageName)
                    .resizable()
                    .frame(width: geo.size.width * 2 / 3, height: geo.size.height / 3)
                VStack {
                    Text(viewModel.welcomeData.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.system(size: 50, weight: .bold))
                        .padding(.top, 100)
                        .padding(.leading)
                    Text(viewModel.welcomeData.subtitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .font(.system(size: 30, weight: .light))
                        .padding(.leading)
                }
                HStack {
                    Button("<") {
                        viewModel.handleTapBackPage()
                    }
                    .moveButton()
                    Spacer()
                    ForEach(0..<viewModel.welcomePages.count, id: \.self) { i in
                        RoundedRectangle(cornerRadius: .infinity)
                            .frame(width: 20, height: 10)
                            .foregroundColor(i == viewModel.currentPage ? Color("backgroundPink") : Color("disablePink"))
                    }
                    Spacer()
                    Button(">") {
                        let isEndPage = viewModel.handleTapNextPage()
                        if isEndPage {
                            appRouter.state = .login
                        }
                    }
                    .moveButton()
                }
                .padding(.top, 60)
                .padding([.leading, .trailing])
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct MoveButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 60, height: 60)
            .background(.black)
            .foregroundColor(.white)
            .font(.system(size: 25, weight: .black, design: .serif))
            .cornerRadius(.infinity)
    }
}

extension View {
    func moveButton() -> some View {
        self.modifier(MoveButtonModifier())
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

