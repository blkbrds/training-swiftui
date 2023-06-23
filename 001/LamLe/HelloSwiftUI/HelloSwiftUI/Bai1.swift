//
//  Bai1.swift
//  HelloSwiftUI
//
//  Created by Lam Le T. [2] VN.Danang on 6/23/23.
//

import SwiftUI

struct Bai1: View {
    @State var randomColor: Color = Color.gray
    
    var body: some View {
        VStack {
            Button("Tap") {
                randomColor = Color(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1)
                    )
            }
            .font(.system(size: 28, weight: .bold, design: .serif))
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(10)
            .background(Color.blue.opacity(0.7))
            .cornerRadius(20)
            .shadow(color: .white, radius: 4)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(randomColor)
    }
}

struct Bai1_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Bai1().previewDisplayName("Hello SwiftUI")
            Bai1()
                .previewLayout(.fixed(width: 700, height: 500))
                .previewDisplayName("Theo Kich Thuoc")
            Bai1()
                .previewLayout(.device)
                .previewDevice("iPhone 11 Pro Max")
                .previewDisplayName("Theo Device")
        }
    }
}
