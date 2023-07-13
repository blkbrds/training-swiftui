//
//  CustomButton.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/13/23.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var subTitle: String
    @State var count: Int = 0
    var nameIcon: String?
    var backGroupColor: Color = .blue
    var textTitleColor: Color = .white
    
    var body: some View {
        Button(action: {
            count += 1
        }
            , label: {
            HStack {
                if let nameIcon = nameIcon {
                    Image(nameIcon)
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                VStack(alignment: .leading) {
                    Text("\(title) : \(count)")
                        .font(.title2)
                    Text(subTitle)
                }
            }
        })
        .buttonModifier(backGroupColor: backGroupColor, textTileColor: textTitleColor)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Facebook", subTitle: "Elon Musk", nameIcon: "facebook")
    }
}
