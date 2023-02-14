//
//  LightAndDarkModeView.swift
//  BaiTap2
//
//  Created by Tu Le C. [2] VN.Danang on 13/02/2023.
//

import SwiftUI

struct LightAndDarkMode1View: View {

    var body: some View {
        Text("Text color theo thiết bị")
            .font(.title)
            .shadow(color: Color.white.opacity(0.8), radius: 4, x: 0, y: 2)
            .padding()
            .background(Color("TextBackgroundColor"))
            .cornerRadius(16)
            .shadow(color: Color("TextBackgroundColor"), radius: 8, x: 0, y: 4)
            .padding()
    }
}

struct LightAndDarkMode1View_Previews: PreviewProvider {
    static var previews: some View {
        LightAndDarkMode1View()
    }
}
