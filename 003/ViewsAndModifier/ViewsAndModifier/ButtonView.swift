//
//  ButtonView.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/02/2023.
//

import SwiftUI

struct ButtonView: View {

    var icon: String?
    var title: String = ""
    var subtitle: String?

    var body: some View {
        Button(action: { }
            , label: {
                VStack(spacing: 0) {
                    HStack(spacing: 10) {
                        if let icon = icon {
                            Image(icon)
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        Text(title)
                            .font(.title)
                    }
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.subheadline)
                    }
                }
            })
            .buttonModifier()
    }
}
