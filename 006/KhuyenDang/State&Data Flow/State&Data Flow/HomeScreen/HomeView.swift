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
                    .padding(.top, 100)
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
                    resetUser()
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
                Spacer()
            }
                .toolbar {
                NavigationLink(destination: EditView()) {
                    Text("Edit")
                }
            }
                .background(
                Image("bear")
                    .resizable()
                    .scaledToFill()
            )
                .ignoresSafeArea()
        }
    }
    
    private func resetUser () {
        account.username = nil
        account.fullname = nil
        account.password = nil
        account.age = nil
        account.address = nil
    }
}
