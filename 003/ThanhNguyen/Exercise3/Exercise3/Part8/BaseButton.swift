//
//  BaseButton.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 07/07/2023.
//

import SwiftUI

struct BaseButton: View {

    enum ButtonType: String {
        case facebook
        case google
        case apple
        case none
        case count

        var imageName: String? {
            switch self {
            case .facebook: return "icon_facebook"
            case .google: return "icon_google"
            case .apple: return "icon_apple"
            default: return nil
            }
        }

        var buttonTitle: String {
            switch self {
            case .facebook: return "Sign In with Facebook"
            case .google: return "Sign In with Google"
            case .apple: return "Sign In with Apple"
            case .none: return "Title"
            case .count: return "Count: "
            }
        }

        var subTitle: String? {
            switch self {
            case .none: return "Subtitle"
            default: return nil
            }
        }

        var backgroundColor: Color {
            switch self {
            case .facebook:
                return .blue
            case .google:
                return .white
            case .apple:
                return .black
            case .none:
                return .cyan
            case .count:
                return .orange
            }
        }

        var titleColor: Color {
            switch self {
            case .google:
                return .gray
            default:
                return .white
            }
        }

        var shouldShowBorderShadow: Bool {
            switch self {
            case .google: return true
            default: return false
            }
        }

        var alignmentType: Alignment {
            switch self {
            case .none, .count: return .center
            default: return .leading
            }
        }
    }

    var type: ButtonType = .apple
    @State var tapCount: Int = 0

    var body: some View {
        ZStack {
            if type.shouldShowBorderShadow {
                RoundedRectangle(cornerRadius: .infinity)
                    .fill(.gray)
                    .buttonModifier()
                    .shadow(color: .gray, radius: 2, x: 0, y: 1)
            }
            Button {
                tapCount += 1
                print(type.rawValue)
            } label: {
                HStack {
                    if let imageName = type.imageName {
                        Image(imageName)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.trailing, 10)
                    }
                    VStack {
                        HStack {
                            Text(type.buttonTitle)
                                .foregroundColor(type.titleColor)
                                .font(.system(size: 20, weight: .bold))
                            if type == .count {
                                Text("\($tapCount.wrappedValue)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))
                            }
                        }
                        if let subtitle = type.subTitle {
                            Text(subtitle)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        }
                    }
                }
                .padding(10)
            }
            .buttonModifier()
            .frame(alignment: type.alignmentType)
            .background(type.backgroundColor)
            .cornerRadius(.infinity)
        }
    }
}

struct BaseButton_Previews: PreviewProvider {
    static var previews: some View {
        BaseButton()
    }
}
