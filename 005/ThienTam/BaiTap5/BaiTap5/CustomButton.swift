//
//  CustomButton.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 07/06/2023.
//

import SwiftUI

enum PositionBadgeNumber {
    case topleft
    case topright
    case topcenter
    case centerleft
    case centerright
    case bottomleft
    case bottomcenter
    case bottomright
    
    var postion: Alignment {
        switch self {
        case .topleft:
            return .topLeading
        case .topright:
            return .topTrailing
        case .topcenter:
            return .top
        case .centerleft:
            return .center
        case .centerright:
            return .center
        case .bottomleft:
            return .bottomLeading
        case .bottomcenter:
            return .bottom
        case .bottomright:
            return .bottomTrailing
        }
    }
    
    var vertical: VerticalAlignment {
        switch self {
        case .topleft, .topright, .topcenter:
            return .top
        case .centerleft, .centerright:
            return .center
        case .bottomleft, .bottomcenter, .bottomright:
            return .bottom
        }
    }
    
    var horizontal: HorizontalAlignment {
        switch self {
        case .topleft, .bottomleft, .centerleft:
            return .leading
        case .topright:
            return .trailing
        case .topcenter, .bottomcenter:
            return .center
        case .centerright, .bottomright:
            return .trailing
        }
    }
}
struct CustomButton: View {
    
    var titleButton: String
    var titleBadge: String
    var actionButton: () -> Void
    var kind: PositionBadgeNumber
    
    var body: some View {
        ZStack(alignment: kind.postion) {
            Button {
                actionButton()
            } label: {
                Text(titleButton)
                    .textModifier()
            }
            .buttonModifier(kind: kind)

            Rectangle()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .foregroundColor(.red)
                .overlay(content: {
                Text(titleBadge)
                    .foregroundColor(.white)
            })
                .alignmentGuide(kind.vertical) { dimensions in
                dimensions[VerticalAlignment.top] + 25
            }
                .alignmentGuide(kind.horizontal) { dimensions in
                dimensions[HorizontalAlignment.trailing] - 25
            }
        }
    }
}
