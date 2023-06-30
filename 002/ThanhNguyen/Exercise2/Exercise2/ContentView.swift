//
//  ContentView.swift
//  Exercise2
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 29/06/2023.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme
    let name: String

    private var titleColor: Color {
        colorScheme == .light ? .black : .white
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .environment(\.colorScheme, .light)
            Text("Hello, world!")
                .font(.system(size: 25, weight: .heavy, design: .monospaced))
                .foregroundColor(titleColor)
            Text((name != "") ? name : "---")
                .font(.title)
                .foregroundColor(titleColor)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "")
    }
}
