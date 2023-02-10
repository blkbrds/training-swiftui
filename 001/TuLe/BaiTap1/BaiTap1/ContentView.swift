//
//  ContentView.swift
//  BaiTap1
//
//  Created by Tu Le C. [2] VN.Danang on 09/02/2023.
//

import SwiftUI

struct ContentView: View {

    var colors: [Color] = [.red, .blue, .black, .orange]
    @State var backgroundColor: Color = .white

    var body: some View {
        VStack {
            Button {
                guard let element = colors.randomElement() else {
                    backgroundColor = .red
                    return
                }
                backgroundColor = element
            } label: {
                Text("Tap")
                    .padding()
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 20)
            .background(Color.blue)
            .clipShape(Capsule())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewLayout(.fixed(width: 568, height: 320))
            ContentView().previewLayout(.fixed(width: 184, height: 224))
                .previewDisplayName("Apple watch series 4")
        }
    }
}
