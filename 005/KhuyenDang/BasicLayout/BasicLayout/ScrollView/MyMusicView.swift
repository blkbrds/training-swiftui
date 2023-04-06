//
//  MyMusicView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 21/03/2023.
//

import SwiftUI

struct MyMusicView: View {

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.976, green: 0.976, blue: 0.976))
                .cornerRadius(10)
                .frame(height: 90)

            HStack {
                Image("music")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                    .padding(.leading, 10)

                VStack(spacing: 10) {
                    MyText(value: "Henning-olsens slow")
                        .font(.system(size: 20, weight: .medium))
                    MyText(value: "Chumed icecrem")
                        .font(.system(size: 17, weight: .light))

                }.frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 3) {
                    Rectangle()
                        .mask(Circle())
                        .foregroundColor(.pink)
                        .frame(width: 5, height: 5)
                    Rectangle()
                        .mask(Circle())
                        .foregroundColor(.pink)
                        .frame(width: 5, height: 5)
                    Rectangle()
                        .mask(Circle())
                        .foregroundColor(.pink)
                        .frame(width: 5, height: 5)
                }
                    .padding(.trailing, 10)
            }
        }
    }
}
