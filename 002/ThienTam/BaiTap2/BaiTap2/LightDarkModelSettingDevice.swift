//
//  LightDarkModelSettingDevice.swift
//  BaiTap2
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 21/05/2023.
//

import SwiftUI

struct LightDarkModelSettingDevice: View {

    @Environment(\.colorScheme) var colorScheme
    @State private var showingAlert = false

    var body: some View {
        VStack {
            Text(colorScheme == .dark ? "Dark Mode" : "Light Mode")
                .font(.largeTitle)
                .foregroundColor(Color("textColor"))
            
            Button("Tap me") {
                showingAlert = true
            }
            .foregroundColor(Color("textColor"))
            .padding()
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Important message"), message: Text("Hello"), dismissButton: .default(Text("Got it!")))
            }
            Rectangle()
                .frame(width: 100, height: 100)
                .environment(\.colorScheme, .light)
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("background"))
            .edgesIgnoringSafeArea(.all)
    }
}

struct LightDarkModelSettingDevice_Previews: PreviewProvider {
    static var previews: some View {
        LightDarkModelSettingDevice()
    }
}
