//
//  CalculatorView.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

enum CalculatorButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case sum = "+"
    case subtraction = "-"
    case multiplication = "X"
    case division = "÷"
    case dao = "+/-"
    case divisionAndRemainder = "%"
    case result = "="
    case reset = "AC"
    case decimal = "."

    var backGroundButton: Color {
        switch self {
        case .division, .multiplication, .subtraction, .sum, .result:
            return .orange
        case .reset, .dao, .divisionAndRemainder:
            return Color("specialButtonColor")
        default : return .gray
        }
    }

    var buttonWidth: CGFloat {
        switch self {
        case .zero:
            return (UIScreen.main.bounds.width - 10) / 2
        default: return (UIScreen.main.bounds.width - 35) / 4
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .zero:
            return (UIScreen.main.bounds.width - 60) / 2
        default: return (UIScreen.main.bounds.width - 60) / 4
        }
    }
}

struct CalculatorView: View {
    @State private var value = "0"
    let buttons: [[CalculatorButton]] = [
        [.reset, .dao, .divisionAndRemainder, .division],
        [.seven, .eight, .nine, .multiplication],
        [.four, .five, .six, .subtraction],
        [.one, .two, .three, .sum],
        [.zero, .decimal, .result]
    ]

    func tappingButton(button: CalculatorButton) {
        switch button {
        case .dao, .division, .divisionAndRemainder, .multiplication, .sum, .subtraction, .result:
           break
        case .reset:
            value = "0"
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            } else {
                value = "\(value)\(number)"
            }
        }
    }

    var body: some View {
        ZStack (alignment: .bottom) {
            Color("backGroupCalculator").edgesIgnoringSafeArea(.all)
            VStack {
                Text(value)
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 88, weight: .light))
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { button in
                            Button {
                                print("Giá trị của button là \(button.rawValue)")
                                tappingButton(button: button)
                            } label: {
                                Text(button.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: button.buttonWidth, height: 88)
                                    .foregroundColor(.white)
                                    .background(button.backGroundButton)
                                    .cornerRadius(button.cornerRadius)
                            }
                        }
                    }
                }
            }
        }
    }
}
struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
