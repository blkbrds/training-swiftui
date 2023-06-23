//
//  Bai1.swift
//  HelloSwiftUI
//
//  Created by Lam Le T. [2] VN.Danang on 6/23/23.
//

import SwiftUI

struct Bai1: View {
    @State var randomColor: Color = Color.gray
    let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack {
            Button("Tap") {
                randomColor = Color(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1)
                    )
            }
            .font(.title3)
            .foregroundColor(Color.black)
            .frame(width: 100, height: 50)
        }
        .frame(width: screenWidth, height: screenHeight)
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
