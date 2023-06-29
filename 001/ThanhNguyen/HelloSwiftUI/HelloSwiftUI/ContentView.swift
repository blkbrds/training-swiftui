//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 27/06/2023.
//

import SwiftUI

struct ContentView: View {

    @State var backgroundColor: Color = .white
    internal var didAppear: ((Self) -> Void)?

    var body: some View {
        VStack {
            Button("Tap me") {
                backgroundColor = Color(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1)
                )
            }
            .onAppear {
                self.didAppear?(self)
            }
            .frame(maxWidth: 150, maxHeight: 50)
            .font(.system(size: 30, weight: .heavy, design: .rounded))
            .padding(10)
            .background(
                LinearGradient(colors: [.pink, .orange], startPoint: .bottomLeading, endPoint: .topTrailing)
            )
            .foregroundColor(.white)
            .cornerRadius(.infinity)
            .shadow(color: .pink, radius: 5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDisplayName("Default")
        ContentView().previewLayout(.fixed(width: 667, height: 375)).previewDisplayName("Fixed Size")
        ContentView().previewDevice(.init(rawValue: "iPad Pro (12.9-inch) (6th generation)")).previewDisplayName("iPad Pro (12.9-inch) (6th generation)")
    }
}
