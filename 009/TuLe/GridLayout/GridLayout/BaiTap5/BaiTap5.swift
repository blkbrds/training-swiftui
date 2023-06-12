//
//  BaiTap5.swift
//  GridLayout
//
//  Created by Tu Le C. [2] VN.Danang on 09/06/2023.
//

import SwiftUI

struct BaiTap5: View {
    
    private var configGridItem = [
        GridItem(.flexible(), spacing: 10)
    ]
    let randomColor1 = Color(red: Double.random(in: 0...1),
                             green: Double.random(in: 0...1),
                             blue: Double.random(in: 0...1))
    let randomColor2 = Color(red: Double.random(in: 0...1),
                             green: Double.random(in: 0...1),
                             blue: Double.random(in: 0...1))

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(
                columns: configGridItem,
                spacing: 10
            ) {

                let gradient1 = LinearGradient(colors: [randomColor1, randomColor2], startPoint: .topLeading, endPoint: .bottomTrailing)
                let gradient2 = LinearGradient(colors: [randomColor2, randomColor1], startPoint: .topLeading, endPoint: .bottomTrailing)

                Section(header: customVHeader(with: "Section1", color: gradient1)) {
                    LazyVGrid(columns: createGridItems(for: 1)) {
                        ForEach(1...7, id: \.self) { index in
                            Image("dragonBall\(index)")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity, minHeight: 50)
                        }
                    }
                }
                Section(header: customVHeader(with: "Section2", color: gradient2)) {
                    LazyVGrid(columns: createGridItems(for: 2)) {
                        ForEach(10...19, id: \.self) { index in
                            Text("2.\(index)")
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.random)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 10.0)
                                )
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity)
    }
    
    private func customVHeader(with header: String, color: LinearGradient) -> some View {
      Text(header)
        .font(.title2)
        .bold()
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(color)
        .cornerRadius(10)
    }

    func createGridItems(for section: Int) -> [GridItem] {
            switch section {
            case 1:
                return [
                    GridItem(.flexible(minimum: 0, maximum: .infinity)),
                    GridItem(.flexible(minimum: 0, maximum: .infinity))
                ]
            case 2:
                return [
                    GridItem(.flexible(), spacing: 10),
                    GridItem(.fixed(100))
                ]
            default:
                return []
            }
        }
}

struct BaiTap5_Previews: PreviewProvider {
    static var previews: some View {
        BaiTap5()
    }
}

extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}
