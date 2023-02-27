//
//  TypeLoginView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 21/02/2023.
//

import SwiftUI

struct TypeLoginView: View {

    var imageName: String

    var body: some View {
        Button {
            print("")
        } label: {
            Image(imageName)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 254 / 255, green: 129 / 255, blue: 10 / 255), Color(red: 255 / 255, green: 219 / 255, blue: 100 / 255)]), startPoint: .bottomTrailing, endPoint: .topLeading), lineWidth: 2)
        }
    }
}
