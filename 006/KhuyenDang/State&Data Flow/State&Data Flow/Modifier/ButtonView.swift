//
//  ButtonView.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 03/04/2023.
//

import SwiftUI

struct ButtonView: View {

    var icon: String?
    @State var title: Int = 0
    var subtitle: String?

    var body: some View {
        Button(action: {
            title += 1
        }
            , label: {
                VStack(spacing: 0) {
                    HStack(spacing: 10) {
                        if let icon = icon {
                            Image(icon)
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        Text("\(title)")
                            .font(.title)
                    }
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.subheadline)
                    }
                }
            })
            .myButtonModifier()
    }
}
