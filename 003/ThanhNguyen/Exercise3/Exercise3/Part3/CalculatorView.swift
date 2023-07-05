//
//  CalculatorView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 05/07/2023.
//

import SwiftUI

struct CalculatorView: View {

    private var matrixButton = [
        ["AC", "+/_", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ",", "="]
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
                ForEach(matrixButton, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(row, id: \.self) { buttonText in
                            Button(buttonText) {
                                print(buttonText)
                            }
                            .frame(
                                width: buttonText == "0"
                                ? (geo.size.width - 4 * 10) / 2 + 5
                                : height,
                                height: height
                            )
                            .font(.system(size: 30, weight: .heavy, design: .rounded))
                            .foregroundColor(checkButtonColor(buttonText).foreground)
                            .background(checkButtonColor(buttonText).background)
                            .cornerRadius(.infinity)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    }

    private func checkButtonColor(_ button: String) -> (foreground: Color, background: Color) {
        switch button {
        case "AC", "+/_", "%":
            return (.black, Color("lightGray"))
        case "÷", "×", "-", "+", "=":
            return (.white, .orange)
        default:
            return (.white, Color("darkGray"))
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
