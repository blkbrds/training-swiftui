//
//  ChangeModeView.swift
//  SwiftUIDemo
//
//  Created by Khoa Vo T.A. VN.Danang on 19/06/2023.
//

import SwiftUI

struct Define {
    static let appTextColor: String = "AppTextColor"
    static let appBackgroundColor: String = "AppBackgroundColor"
}

struct ChangeModeView: View {

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: .leastNormalMagnitude) {
            Text(colorScheme == .dark ? "It's in dark mode" : "It's in light mode")
                .padding()
                .foregroundColor(Color(Define.appTextColor))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(Define.appBackgroundColor))
            Text("Always in light mode")
                .padding()
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.purple)
                .environment(\.colorScheme, .light)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ChangeModeView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeModeView()
            .environment(\.colorScheme, .light)
    }
}
