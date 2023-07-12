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
    var currentPage: Int = 3

    var body: some View {
        GeometryReader { geo in
            VStack {
                Image("img_welcome")
                    .resizable()
                    .frame(width: geo.size.width * 2 / 3, height: geo.size.height / 3)
                VStack {
                    Text("Make connects with Travello")
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.system(size: 50, weight: .bold))
                        .padding(.top, 100)
                    Text("To your dream trip")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .font(.system(size: 30, weight: .light))
                        .padding(.leading)
                }
                HStack {
                    ForEach(0..<numberOfPage, id: \.self) { i in
                        RoundedRectangle(cornerRadius: .infinity)
                            .frame(width: 20, height: 10)
                            .foregroundColor(i + 1 == currentPage ? Color("backgroundPink") : Color("disablePink"))
                    }
                    Spacer()
                    Button(">") {
                        appRouter.state = .login
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
