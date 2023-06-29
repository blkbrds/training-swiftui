//
//  ButtonBadge.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 25/06/2023.
//

import SwiftUI

enum PositionBadge {
    case topLeft
    case topRight
    case topCenter
    case centerLeft
    case centerRight
    case bottomLeft
    case bottomRight
    case bottomCenter
}

enum TypeButton {

    case email
    case friends
    case photos

    func value() -> (title: String, backgroundColor: Color, borderColor: Color) {
        switch self {
        case .email:
            return ("Email", .green, Color(red: 0.336, green: 0.519, blue: 0.21))
        case .friends:
            return ("Friends", .yellow, Color(red: 1.001, green: 0.767, blue: 0.147))
        case .photos:
            return ("Photos", .purple, Color(red: 0.439, green: 0.19, blue: 0.626))
        }
    }
}

struct ButtonBadge: View {

    @Binding var numberBadge: Int
    var typeButton: TypeButton
    var typeBadgePosition: PositionBadge
    var sizeButton: CGSize = CGSize(width: 200, height: 100)

    func badgePosition() -> (x: CGFloat, y: CGFloat) {
        switch typeBadgePosition {
        case .topLeft:
            return (-sizeButton.width / 2, -sizeButton.height / 2)
        case .topRight:
            return (-sizeButton.width / 2, -sizeButton.height / 2)
        case .topCenter:
            return (0, -sizeButton.height / 2)
        case .centerLeft:
            return (-sizeButton.width / 2, 0)
        case .centerRight:
            return (sizeButton.width / 2, 0)
        case .bottomLeft:
            return (-sizeButton.width / 2, sizeButton.height / 2)
        case .bottomRight:
            return (sizeButton.width / 2, sizeButton.height / 2)
        case .bottomCenter:
            return (0, sizeButton.height / 2)
        }
    }

    var body: some View {
        ZStack {
            Button(action: { }, label: {
                    Text(typeButton.value().title)
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                })
                .frame(width: sizeButton.width, height: sizeButton.height)
                .background(typeButton.value().backgroundColor)
                .cornerRadius(10)
                .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(typeButton.value().borderColor)
            )
            Badge(numberBadge: numberBadge)
                .offset(x: badgePosition().x, y: badgePosition().y)
        }
    }
}
