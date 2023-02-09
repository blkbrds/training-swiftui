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
    @State private var showingAlert = false

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Text((name != "") ? name : "---")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            Text(colorScheme == .dark ? "In dark mode" : "In light mode")
            Button("Tap me for a surprise") {
                showingAlert = true
            }
                .padding()
                .alert(isPresented: $showingAlert) {
                Alert(title: Text("Important message"), message: Text("You are so beautiful"), dismissButton: .default(Text("Got it!")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "")
    }
}
