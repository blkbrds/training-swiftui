//
//  MyTabbarView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/03/2023.
//

import SwiftUI

struct MyTabbarView: View {

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: -25) {
                CenterBarItem()
                HStack {
                    LeftBarItem()
                    Spacer()
                    RightBarItem()
                }
                    .padding([.leading, .trailing], 35)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .background(Color.white.clipShape(CustomShape())
                        .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
                )
            }
        }
            .ignoresSafeArea()
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in

            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))

            let center = rect.width / 2
            path.move(to: CGPoint(x: center - 70, y: 0))

            let to1 = CGPoint(x: center, y: 35)
            let control1 = CGPoint(x: center - 35, y: 0)
            let control2 = CGPoint(x: center - 35, y: 35)

            let to2 = CGPoint(x: center + 70, y: 0)
            let control3 = CGPoint(x: center + 35, y: 35)
            let control4 = CGPoint(x: center + 35, y: 0)

            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}