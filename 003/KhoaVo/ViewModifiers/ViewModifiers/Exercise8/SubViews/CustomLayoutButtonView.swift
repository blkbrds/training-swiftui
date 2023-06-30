//
//  CustomLayoutButtonView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 30/06/2023.
//

import SwiftUI

struct CustomLayoutButtonView: View {

    var imageName: String?
    var title: String
    var subtitle: String?

    var body: some View {
        Button(action: {
            print("title = \(title)")
        }, label: {
            HStack(spacing: 10) {
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .tint(.white)
                }
                VStack(spacing: 10) {
                    Text("\(title)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                    }

                }
            }
        })
        .buttonModifier()
    }
}
