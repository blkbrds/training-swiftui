//
//  ContentView.swift
//  BaiTap2
//
//  Created by Tu Le C. [2] VN.Danang on 10/02/2023.
//

import SwiftUI

struct ContentView: View {

    let name: String

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Text((name != "") ? name : "....")
                .font(.title)
                .foregroundColor(Color.blue)
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
