//
//  TabbarView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 01/08/2023.
//

import SwiftUI

struct TabbarView: View {

    var body: some View {
        VStack(spacing: -45) {
            TabBarShape()
                .fill(Color.white)
                .frame(height: 60)
                .shadow(color: .gray, radius: 2, x: 0, y: -1)
                .mask(TabBarShape().padding(.top, -50))
                .overlay(
                    Button(action: {
                        print("Tap scan")
                    }, label: {
                        Image(systemName: "qrcode.viewfinder")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    })
                    .frame(width: 60, height: 60)
                    .background(.red.opacity(0.7))
                    .cornerRadius(.infinity)
                    .offset(x: 0, y: -25)
                )
            HStack {
                Image(systemName: "homekit")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.red.opacity(0.7))
                Spacer()
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.red.opacity(0.7))
                    .padding(.trailing, 80)
                Spacer()
                Image(systemName: "heart.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.red.opacity(0.7))
                Spacer()
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.red.opacity(0.7))
            }
            .padding([.leading, .trailing, .bottom], 20)
        }
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

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
