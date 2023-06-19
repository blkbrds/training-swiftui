//
//  ChangeModeView.swift
//  SwiftUIApp
//
//  Created by Khoa Vo T.A. VN.Danang on 19/06/2023.
//

import SwiftUI

struct ChangeModeView: View {

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: .leastNormalMagnitude) {
            Text(colorScheme == .dark ? "It's in dark mode" : "It's in light mode")
                .padding()
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(colorScheme == .dark ? .black : .white)
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
            .environment(\.colorScheme, .dark)
    }
}
