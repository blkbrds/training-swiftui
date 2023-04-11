//
//  HomeView.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/04/2023.
//

import SwiftUI

struct HomeView: View {
    @State var account: Account

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
                        MyText(value: account.fullname)
                        MyText(value: "\(account.age)")
                        MyText(value: account.address)
                    }
                }
                Spacer()
            }
                .toolbar {
                NavigationLink(destination: EditView(fullname: $account.fullname, address: $account.address, age: $account.age)) {
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
}
