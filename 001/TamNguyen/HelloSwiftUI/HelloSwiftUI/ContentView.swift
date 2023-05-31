//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 10/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    // State
    @State private var backgroundColor: Color = .white
    
    // Properties
    let colors = [Color.red, Color.green, Color.blue, Color.yellow, Color.orange]

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            Button {
                let randomIndex = Int.random(in: 0..<colors.count)
                backgroundColor = colors[randomIndex]
            }
            label: {
                Text("Tap vao em di")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            print("View is appear")
        }
        .onDisappear {
            print("View is disappeear")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14")
        ContentView().previewDevice("iPhone SE (2nd generation)")
        ContentView().previewLayout(.fixed(width: 300, height: 300))
    }
}
