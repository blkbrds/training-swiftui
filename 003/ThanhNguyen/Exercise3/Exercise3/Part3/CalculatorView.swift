//
//  CalculatorView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 05/07/2023.
//

import SwiftUI

struct CalculatorView: View {

    enum ButtonType {
        case number
        case calculation
        case specialCalculation

        var titleColor: Color {
            switch self {
            case .specialCalculation: return .black
            default: return .white
            }
        }

        var backgroundColor: Color {
            switch self {
            case .number: return Color("darkGray")
            case .calculation: return .orange
            case .specialCalculation: return Color("lightGray")
            }
        }
    }

    struct CalculatorButton {
        let type: ButtonType
        let title: String
    }

    private let matrixButton: [[CalculatorButton]] = [
        [
            .init(type: .specialCalculation, title: "AC"),
            .init(type: .specialCalculation, title: "+/_"),
            .init(type: .specialCalculation, title: "%"),
            .init(type: .calculation, title: "÷")
        ],
        [
            .init(type: .number, title: "7"),
            .init(type: .number, title: "8"),
            .init(type: .number, title: "9"),
            .init(type: .calculation, title: "×")
        ],
        [
            .init(type: .number, title: "4"),
            .init(type: .number, title: "5"),
            .init(type: .number, title: "6"),
            .init(type: .calculation, title: "-")
        ],
        [
            .init(type: .number, title: "1"),
            .init(type: .number, title: "2"),
            .init(type: .number, title: "3"),
            .init(type: .calculation, title: "+")
        ],[
            .init(type: .number, title: "0"),
            .init(type: .number, title: "."),
            .init(type: .calculation, title: "="),
        ]
    ]

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 10) {
                Spacer()
                HStack {
                    Spacer()
                    Text("0")
                        .foregroundColor(.white)
                        .font(.system(size: 100))
                        .padding(.trailing, 20)
                }
                let height = (geo.size.width - 5 * 10) / 4
                ForEach(Array(matrixButton.enumerated()), id: \.offset) { row in
                    HStack(spacing: 10) {
                        ForEach(Array(row.element.enumerated()), id: \.offset) { button in
                            Button(button.element.title) {
                                print(button.element.title)
                            }
                            .frame(
                                width: button.element.title == "0"
                                ? (geo.size.width - 4 * 10) / 2 + 5
                                : height,
                                height: height
                            )
                            .font(.system(size: 30, weight: .heavy, design: .rounded))
                            .foregroundColor(button.element.type.titleColor)
                            .background(button.element.type.backgroundColor)
                            .cornerRadius(.infinity)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
