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
            Text("I am a cute dog, welcome \(name != "" ? name : "you") to SwiftUI class")
                .multilineTextAlignment(.leading)
                .foregroundColor(Color("TextColor"))

            Image("My dog")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height / 2)

            Button("Tap me for a surprise") {
                showingAlert = true
            }
            .foregroundColor(Color("TextColor"))
                .padding()
                .background(Color("BackgroundButton"))
                .cornerRadius(30)
                .alert(isPresented: $showingAlert) {
                Alert(title: Text("Important message"), message: Text("You are so beautiful"), dismissButton: .default(Text("Got it!")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "").environment(\.colorScheme, .light)
    }
}
