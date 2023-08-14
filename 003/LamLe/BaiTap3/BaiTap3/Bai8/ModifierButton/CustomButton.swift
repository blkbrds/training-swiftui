//
//  CustomButton.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

enum ButtonType: String {
    case facebook = "Facebook"
    case twitter = "Twitter"
    case google = "Google"
    case title = "Title"
    case count = "Count"
    
    var backGroupButton: Color {
        switch self {
        case .facebook:
            return .blue.opacity(0.8)
        case .google:
            return .white.opacity(0.7)
        case .twitter:
            return .blue.opacity(0.6)
        case .title:
            return .brown.opacity(0.7)
        case .count:
            return .gray.opacity(0.7)
        }
    }
    
    var nameIcon: String? {
        switch self {
        case .facebook:
            return "facebook"
        case .twitter:
            return "twitter"
        case .google:
            return "google"
        default:
            return ""
        }
    }
    
    var title: String {
        switch self {
        case .facebook:
            return "Mark Zuckerberg"
        case .twitter:
            return "Elon Musk"
        case .google:
            return "Larry Page"
        case .title:
            return "Sub Title"
        case .count:
            return "Count"
        }
    }
}

struct CustomButton: View {
    @State var count: Int = 0
    var textTitleColor: Color
    
    var buttonType: ButtonType = .facebook

    var body: some View {
        Button(action: {
            count += 1
        }
            , label: {
            HStack {
                if let nameICon = buttonType.nameIcon {
                    Image(nameICon)
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                VStack(alignment: .leading) {
                    if buttonType == .count {
                        Text("\(buttonType.title) = \(count)")
                            .font(.title)
                    } else {
                        Text("\(buttonType.rawValue)")
                            .font(.title2)
                        Text(buttonType.title)
                    }
                }
            }
        })
        .buttonModifier(backGroupColor: buttonType.backGroupButton, textTileColor: textTitleColor)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(textTitleColor: .white, buttonType: .facebook)
    }
}
