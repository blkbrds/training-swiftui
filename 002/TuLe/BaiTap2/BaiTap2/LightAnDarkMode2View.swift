//
//  LightAnDarkMode2View.swift
//  BaiTap2
//
//  Created by Tu Le C. [2] VN.Danang on 13/02/2023.
//

import SwiftUI

struct LightAndDarkMode2View: View {

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    let backgroundTextColor: Color = Color(red: 254 / 255, green: 44 / 255, blue: 85 / 255)

    var body: some View {
        Text("Text color độc lập")
            .font(.title)
            .shadow(color: Color.white.opacity(0.8), radius: 4, x: 0, y: 2)
            .padding()
            .cornerRadius(16)
            .padding()
            .environment(\.colorScheme, .light)
    }
}

struct LightAndDarkMode2View_Previews: PreviewProvider {
    static var previews: some View {
        LightAndDarkMode2View()
    }
}
