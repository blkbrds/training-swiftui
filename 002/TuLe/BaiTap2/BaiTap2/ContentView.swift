//
//  ContentView.swift
//  BaiTap2
//
//  Created by Tu Le C. [2] VN.Danang on 10/02/2023.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var isShowAlert = false
    let name: String

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .background(colorScheme == .dark ? Color(.black) : Color(.white))
                .padding()

            Text("My name is Lê Công Tú")
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(colorScheme == .dark ? Color(.white) : Color(.blue), lineWidth: 4)
                }
            
            Text("Default an environment variable value for Text")
                .multilineTextAlignment(.center)
                .environment(\.colorScheme, .light)
                .padding()
            
            Text((name != "") ? name : "....")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()

            Button {
                isShowAlert = true
            } label: {
                Text("Tap me")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text("Show alert"), message: Text("Hello alert"), dismissButton: .default(Text("Got it!")))
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "")
    }
}
