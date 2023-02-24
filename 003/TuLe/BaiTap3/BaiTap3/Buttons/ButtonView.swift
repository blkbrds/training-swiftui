//
//  ButtonView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 20/02/2023.
//

import SwiftUI

struct ButtonView: View {

    @Binding var title: Int
    var subTitle: String?
    var image: Image?

    var body: some View {
        Button {
            title += 1
        } label: {
            HStack() {
                image?
                    .resizable()
                    .frame(width: 30, height: 30)
                VStack(alignment: .leading) {
                    Text("Title \(title)")
                        .font(.system(size: 20))
                    if let subTitle = subTitle {
                        Text(subTitle)
                            .font(.system(size: 15))
                            .opacity(0.7)
                    }
                }
            }
        }
        .modifierButton()
    }
}

extension View  {
    func modifierButton() -> some View {
        ModifiedContent(
            content: self,
            modifier: ButtonModifier()
        )
    }
}
