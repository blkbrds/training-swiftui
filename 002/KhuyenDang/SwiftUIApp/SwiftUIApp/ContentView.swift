//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by Khuyen Dang T.T. VN.Danang on 09/02/2023.
//

import SwiftUI

struct ContentView: View {
    let name: String
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Text((name != "") ? name : "---")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            Text(colorScheme == .dark ? "In dark mode" : "In light mode")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "")
    }
}