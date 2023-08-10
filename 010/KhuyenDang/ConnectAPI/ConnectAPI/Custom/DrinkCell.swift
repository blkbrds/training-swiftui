//
//  DrinkCell.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 10/08/2023.
//

import SwiftUI

struct DrinkCell: View {

    var drink: Drink
    let heightCell: CGFloat = 270
    let widthCelll: CGFloat = (UIScreen.main.bounds.width - 40) / 2

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: drink.image)) { image in
                image
                    .resizable()
                    .frame(height: heightCell / 2)
                    .scaledToFit()
            } placeholder: {
                Color.gray.opacity(0.1)
                    .frame(height: heightCell / 2)
            }
            VStack(spacing: 5) {
                HStack {
                    Text(drink.name)
                        .font(.system(size: 16, weight: .bold))
                        .lineLimit(1)
                    Spacer()
                }
                HStack {
                    Text("1 cup")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
                .padding(.leading)
            HStack {
                Text("$" + String(format: "%.2f", generateRandomFloat()))
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                Button(action: { },
                    label: {
                        Text("+")
                            .frame(width: 40, height: 40)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)

                    })
                    .background(Color.green)
                    .cornerRadius(10)
            }
                .padding(.horizontal)
                .padding(.top, -10)
        }
            .frame(width: widthCelll)
            .padding(.bottom, 5)
            .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.gray.opacity(0.5), lineWidth: 2)
        )
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func generateRandomFloat() -> Float {
        let lowerBound: Float = 0.5
        let upperBound: Float = 10.0
        return Float.random(in: lowerBound...upperBound)
    }
}
