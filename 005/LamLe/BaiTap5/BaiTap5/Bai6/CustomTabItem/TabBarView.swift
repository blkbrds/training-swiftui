//
//  TabBarView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/24/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        GeometryReader { geometry in
           VStack (spacing: 0.0) {
                TabBarShape()
                    .fill(Color.white)
                    .frame(height: 60)
                    .shadow(color: .gray, radius: 2, x: 0, y: -1)
                    .mask(TabBarShape().padding(.top, -50))
                    .overlay(
                        Button(action: {
                            print("Tap scan")
                        }, label: {
                            Image(systemName: "camera.viewfinder")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                        })
                        .frame(width: 60, height: 60)
                        .background(.pink.opacity(0.8))
                        .cornerRadius(.infinity)
                        .offset(x: 0, y: -25)
                    )
            }
            HStack {
                TabItem(width: 50, height: 50, nameImage: "house")
                    .padding(.leading, 50.0)
                    
                Spacer()
                TabItem(width: 50, height: 50, nameImage: "person")
                    .padding(.trailing, 50.0)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}


struct TabBarShape: Shape {

    private enum Constants {
        static let cornerRadius: CGFloat = 20
        static let buttonRadius: CGFloat = 30
        static let buttonPadding: CGFloat = 5
    }

    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: .init(x: 0, y: rect.height))
            path.addLine(to: .init(x: 0, y: rect.height - Constants.cornerRadius))
            path.addArc(
                center: .init(x: Constants.cornerRadius, y: Constants.cornerRadius),
                radius: Constants.cornerRadius,
                startAngle: .radians(CGFloat.pi),
                endAngle: .radians(-CGFloat.pi / 2),
                clockwise: false
            )

            let lineEnd = rect.width / 2 - 2 * Constants.buttonPadding - Constants.buttonRadius
            path.addLine(to: .init(x: lineEnd, y: 0))
            path.addArc(
                center: .init(x: lineEnd, y: Constants.buttonPadding),
                radius: Constants.buttonPadding,
                startAngle: .radians(-CGFloat.pi / 2),
                endAngle: .zero,
                clockwise: false
            )
            path.addArc(
                center: .init(x: rect.width / 2, y: Constants.buttonPadding),
                radius: Constants.buttonPadding + Constants.buttonRadius,
                startAngle: .radians(CGFloat.pi),
                endAngle: .zero,
                clockwise: true
            )

            let lineStart = rect.width / 2 + 2 * Constants.buttonPadding + Constants.buttonRadius
            path.addArc(
                center: .init(x: lineStart, y: Constants.buttonPadding),
                radius: Constants.buttonPadding,
                startAngle: .radians(CGFloat.pi),
                endAngle: .radians(-CGFloat.pi / 2),
                clockwise: false
            )
            path.addLine(to: .init(x: rect.width - Constants.cornerRadius, y: 0))
            path.addArc(
                center: .init(x: rect.width - Constants.cornerRadius, y: Constants.cornerRadius),
                radius: Constants.cornerRadius,
                startAngle: .radians(-CGFloat.pi / 2),
                endAngle: .zero,
                clockwise: false
            )
            path.addLine(to: .init(x: rect.width, y: rect.height))
        }
    }
}
