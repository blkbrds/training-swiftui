//
//  LightAndDarkModeView.swift
//  BaiTap2
//
//  Created by Tu Le C. [2] VN.Danang on 13/02/2023.
//

import SwiftUI

struct LightAndDarkMode1View: View {

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    let backgroundTextColor: Color = Color(red: 254 / 255, green: 44 / 255, blue: 85 / 255)

    var body: some View {
        Text("Text color theo thiết bị")
            .font(.title)
            .foregroundColor(colorScheme == .dark ? .black : .white)
            .shadow(color: Color.white.opacity(0.8), radius: 4, x: 0, y: 2)
            .padding()
            .background(colorScheme == .dark ? .white : backgroundTextColor)
            .cornerRadius(16)
            .shadow(color: colorScheme == .dark ? .white : backgroundTextColor, radius: 8, x: 0, y: 4)
            .padding()
    }
}

struct LightAndDarkMode1View_Previews: PreviewProvider {
    static var previews: some View {
        LightAndDarkMode1View()
    }
}
