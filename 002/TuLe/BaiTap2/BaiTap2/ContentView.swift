//
//  ContentView.swift
//  BaiTap2
//
//  Created by Tu Le C. [2] VN.Danang on 13/02/2023.
//

import SwiftUI

struct ContentView: View {

    @State private var isPresentAlert = false
    @State private var userName: String = ""
    @State private var myString: String = "Hello, word!"
    let name: String
    let gradientButton = LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(myString)
                .padding()
            Text((name != "") ? name : "...")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            
            Button {
                isPresentAlert = true
            } label: {
                Text("Tap me")
                    .padding()
            }
            .background(Capsule()
            .stroke(gradientButton, lineWidth: 5)
            .saturation(1.8))
            .alert("Enter your text", isPresented: $isPresentAlert, actions: {
                TextField("Username", text: $userName)
                Button("Ok", action: {
                    myString = userName
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
