//
//  BaiTap1.swift
//  HelloSwiftUI
//
//  Created by Lam Le T. [2] VN.Danang on 6/26/23.
//
import SwiftUI

struct Bai1: View {
//    @State var randomColor: Color = Color.gray
    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            Button("Tap") {
                viewModel.changeColorRandom()
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
        .background(viewModel.randomColor)
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
                .previewDevice("iPhone 8")
                .previewDisplayName("Theo Device")
        }
    }
}

extension Bai1 {
    final class ViewModel: ObservableObject {
        @Published var randomColor: Color = Color.gray

        func changeColorRandom() {
            randomColor = Color(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1)
                )
        }
    }
}
