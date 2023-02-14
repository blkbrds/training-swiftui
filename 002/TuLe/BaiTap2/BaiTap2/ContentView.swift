//
//  ContentView.swift
//  BaiTap2
//
//  Created by Tu Le C. [2] VN.Danang on 13/02/2023.
//

import SwiftUI

struct ContentView: View {

    @State private var presentAlert = false
    @State private var myTextField: String = ""
    @State private var myText: String = "Hello, word!"
    let name: String
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(myText)
                .padding()
            Text((name != "") ? name : "...")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            
            Button {
                presentAlert = true
            } label: {
                Text("Tap me")
                    .padding()
            }
            .background(Capsule()
            .stroke(gradient, lineWidth: 5)
            .saturation(1.8))
            .alert("Enter your text", isPresented: $presentAlert, actions: {
                TextField("Username", text: $myTextField)
                Button("Ok", action: {
                    myText = myTextField
                })
                Button("Cancel", role: .cancel, action: {})
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "")
    }
}
