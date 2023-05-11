//
//  Bai2View.swift
//  HelloSwiftUI
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 10/05/2023.
//

import SwiftUI

struct Bai2View: View {
    
    // MARK: - Environment
    @Environment (\.colorScheme) var colorScheme
    @State private var isDarkMode = false
    
    // MARK: - Properties
    let name: String

    var body: some View {
        VStack {
            Text("Hello World")
                .padding()
                .foregroundColor(colorScheme == .dark ? .white : .black)
            Text((name != "") ? name : "---")
                .font(.title)
                .foregroundColor(colorScheme == .dark ? .white : .blue)
                .padding()
            Button {
                self.isDarkMode.toggle()
            } label: {
                Text("Mode")
                    .padding()
            }
            .buttonStyle(MyButtonStyle())
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

struct MyButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(20)
    }
}

struct Bai2View_Previews: PreviewProvider {
    static var previews: some View {
        Bai2View(name: "Thien Tam")
    }
}
