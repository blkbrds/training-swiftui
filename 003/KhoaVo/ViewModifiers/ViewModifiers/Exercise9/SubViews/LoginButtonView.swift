//
//  LoginButtonView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 30/06/2023.
//

import SwiftUI

struct LoginButtonView: View {

    var title: String
    var action: (() -> Void)?

    var body: some View {
        Button {
            action!()
        } label: {
            Text("\(title)")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 14))
                .padding(EdgeInsets(top: 20, leading: 60, bottom: 20, trailing: 60))
        }
        .background {
            LinearGradient(colors: [Color(red: 1, green: 100/255, blue: 128/255),
                                    Color(red: 242/255, green: 46/255, blue: 99/255)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        }
    }

    func onButtonPress(action: @escaping () -> Void ) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
}
