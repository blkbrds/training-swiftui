//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Khuyen Dang T.T. VN.Danang on 09/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var red: Double = 1.0
    @State var green: Double = 1.0
    @State var blue: Double = 1.0

    var body: some View {
        VStack {
            Button(action: {
                red = Double.random(in: 0...1)
                green = Double.random(in: 0...1)
                blue = Double.random(in: 0...1)
            }) {
                Text("Tap me").font(.system(size: 30)).foregroundColor(.black)
            }
        }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(.sRGB, red: red, green: green, blue: blue, opacity: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewDevice("iPhone 12 Pro")
        ContentView().previewLayout(.fixed(width: 300, height: 300))
    }
}
