//
//  CustomButton.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/22/23.
//

import SwiftUI

struct CustomButton: View {
    @State var count: Int = 0
    var backgroundColor: Color
    var textTitle: String
    var isBadgeCircle: Bool = false
    var alignmentOfBadge: Alignment
    var positionX: CGFloat
    var postionY: CGFloat
    
    var body: some View {
        Button(action: {
            count += 1
        }
               , label: {
            Text(textTitle)
        })
        .buttonModifier(backGroupColor: backgroundColor)
        .overlay(
            ZStack {
                if count != 0 {
                    if isBadgeCircle {
                        Circle()
                            .fill(Color.red)
                            .frame(width: CGFloat(count) + 20, height: CGFloat(count) + 20)
                            .offset(x: positionX, y: postionY)
                    } else {
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .fill(Color.red)
                            .frame(width: CGFloat(count) + 20, height: CGFloat(count) + 10)
                            .offset(x: positionX, y: postionY)
                    }
                    Text("\(count)")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .offset(x: positionX, y: postionY)
                }
            },
            alignment: alignmentOfBadge
        )
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(backgroundColor: .green, textTitle: "Email", alignmentOfBadge: .center, positionX: 0, postionY: -35)
    }
}
