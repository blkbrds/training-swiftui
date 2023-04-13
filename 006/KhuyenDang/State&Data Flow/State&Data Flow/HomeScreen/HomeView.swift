//
//  HomeView.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/04/2023.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var appRouter: AppRouter
    @EnvironmentObject var account: Account
    private var localStorage = LocalStorage()

    fileprivate func MyText(value: String) -> Text {
        return Text(value)
            .font(.system(size: 20))
    }

    var body: some View {
        NavigationView {
            VStack {

                Image("avatar")
                    .resizable()
                    .scaledToFit()
                    .mask(Circle())
                    .frame(width: 150)
                    .padding(.top, 130)
                    .padding(.bottom, 50)
                    .background(.white)

                HStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        MyText(value: "Fullname:")
                        MyText(value: "Age:")
                        MyText(value: "Address:")
                    }
                    VStack(alignment: .leading) {
                        if let account = account {
                            MyText(value: account.fullname ?? "")
                            MyText(value: "\(account.age ?? 0)")
                            MyText(value: account.address ?? "")
                        }
                    }
                }

                Button(action: {
                    localStorage.resetUser()
                    appRouter.state = .login
                }
                    , label: {
                        HStack {
                            Text("Logout")
                                .foregroundColor(Color("primaryColor"))
                                .font(.system(size: 20))
                            Image("logout")
                                .resizable()
                                .frame(width: 40, height: 35)
                        }
                    })
                    .padding(.top, 30)

                Spacer()
            }
                .toolbar {
                NavigationLink(destination: EditView()) {
                    Text("Edit")
                }
            }
                .background(
                VStack {
                    Spacer()
                    Image("cherry_blossom")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                }
            )
                .ignoresSafeArea()
        }
    }
}
