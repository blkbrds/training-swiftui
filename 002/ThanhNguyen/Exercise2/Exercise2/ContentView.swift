//
//  ContentView.swift
//  Exercise2
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 29/06/2023.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme
    @State private var shouldShowingAlert = false
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
            Button("Tap me") {
                shouldShowingAlert = true
            }
            .alert(isPresented: $shouldShowingAlert, content: {
                Alert(
                    title: .init("Hello Thanh"),
                    message: .init("How are you?"),
                    primaryButton: .cancel(.init("Good")),
                    secondaryButton: .default(.init("Not good"))
                )
            })
            .frame(maxWidth: 100, maxHeight: 40)
            .font(.system(size: 20, weight: .heavy, design: .rounded))
            .padding(10)
            .background(
                LinearGradient(colors: [.pink, .orange], startPoint: .bottomLeading, endPoint: .topTrailing)
            )
            .foregroundColor(.white)
            .cornerRadius(.infinity)
            .shadow(color: .pink, radius: 5)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "")
    }
}