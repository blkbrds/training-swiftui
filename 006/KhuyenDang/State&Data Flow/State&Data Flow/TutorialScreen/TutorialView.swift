//
//  TutorialView.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 11/04/2023.
//

import SwiftUI

struct TutorialView: View {

    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @EnvironmentObject var appRouter: AppRouter

    var body: some View {
        ScrollViewReader { scrollViewProxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    Image("tutorial1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    Image("tutorial2")
                        .resizable()
                        .scaledToFill()
                    Image("tutorial3")
                        .resizable()
                        .scaledToFill()
                        .overlay(
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button(action: {
                                    appRouter.state = .login
                                }
                                    , label: {
                                        Text("Let's get started")
                                            .foregroundColor(.white)
                                            .font(.system(size: 24))
                                            .padding(.all)
                                    })
                                    .background(Color(red: 0.2784313725490196, green: 0.45098039215686275, blue: 0.30196078431372547))
                                    .cornerRadius(20)
                                    .padding(.trailing, 30)
                            }
                                .padding(.bottom, 100)
                        }
                    )
                }
                    .frame(width: UIScreen.main.bounds.width * 3)
            }
                .ignoresSafeArea(.all)
                .onAppear {
                UIScrollView.appearance().isPagingEnabled = true
            }
        }
        .onAppear {
            isFirstLaunch = false
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
