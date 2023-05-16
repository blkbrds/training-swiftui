//
//  CalculatorView.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 12/05/2023.
//

import SwiftUI

struct CalculatorView: View {
    @State var display = "0"
    @State var firstOperand = ""
    @State var secondOperand = ""
    @State var currentOperation = ""

    let buttons = [
        ["AC", "+/-", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "−"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]

    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text(display)
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, alignment: .trailing)

            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { button in
                        CalculatorButton(title: button, action: {
                            self.handleButtonPress(button)
                        })
                    }
                }
            }
        }
        .padding(.horizontal, 6)
    }

    func handleButtonPress(_ button: String) {
        switch button {
        case "÷", "×", "−", "+":
            currentOperation = button
            firstOperand = display
            display = "0"
        case ".":
            if !display.contains(".") {
                display += "."
            }
        case "=":
            secondOperand = display
            display = calculate()
            firstOperand = ""
            secondOperand = ""
            currentOperation = ""
        case "C":
            display = "0"
            firstOperand = ""
            secondOperand = ""
            currentOperation = ""
        case "AC":
            display = "0"
        default:
            if display == "0" {
                display = button
            } else {
                display += button
            }
        }
    }

    func calculate() -> String {
        guard let first = Double(firstOperand), let second = Double(secondOperand) else {
            return "Error"
        }

        switch currentOperation {
        case "÷":
            return String(first / second)
        case "×":
            return String(first * second)
        case "−":
            return String(first - second)
        case "+":
            return String(first + second)
        default:
            return "Error"
        }
    }
}

struct CalculatorButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .frame(width: buttonWidth(), height: buttonHeight())
                .foregroundColor(.white)
                .background(buttonColor())
                .cornerRadius(buttonWidth() / 2)
        }
    }
    
    func buttonColor() -> Color {
        if title == "C" || title == "AC" {
            return Color.gray
        } else if title == "÷" || title == "×" || title == "−" || title == "+" {
            return Color.orange
        } else if title == "=" {
            return Color.orange
        } else {
            return Color.gray
        }
    }
    
    func buttonWidth() -> CGFloat {
        let buttonNormal = (UIScreen.main.bounds.width - 5 * 6) / 4
        if title == "0" {
            return buttonNormal * 2 + 6
        } else {
            return buttonNormal
        }
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 6) / 4
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
