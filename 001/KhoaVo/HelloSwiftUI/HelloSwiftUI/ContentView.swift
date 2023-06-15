//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Khoa Vo T.A. VN.Danang on 15/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State var backgroundColor: Color? = .white

    var body: some View {
        VStack {
            Button {
                backgroundColor = Color.random()
            } label: {
                Text("Tap")
                    .padding(30)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.pink]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.title)
                    .cornerRadius(15)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDisplayName("Default")
        ContentView().previewLayout(.fixed(width: 667, height: 375)).previewDisplayName("Fixed Size")
        ContentView().previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (4th generation)")).previewDisplayName("iPad Pro (11-inch) (4th generation)")
    }
}
