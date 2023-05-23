//
//  CustomButton.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 23/05/2023.
//

import SwiftUI

struct CustomButton: View {

    var icon: String?
    @State var count: Int = 0
    var subtitle: String?

    var body: some View {
        Button(action: {
            count += 1
        }
            , label: {
                VStack(spacing: 0) {
                    HStack(spacing: 10) {
                        if let icon = icon {
                            Image(icon)
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        Text("\(count)")
                            .font(.title)
                    }
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.subheadline)
                    }
                }
            })
        .submitButtonModifier()
    }
}
