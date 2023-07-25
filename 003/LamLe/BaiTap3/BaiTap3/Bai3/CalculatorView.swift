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

    func setWidthOfButton(widthOfScreen: CGFloat) -> CGFloat {
        switch self {
        case .zero:
            return (widthOfScreen - 10) / 2
        default: return (widthOfScreen - 35) / 4
        }
    }
    
    func setCornerRadiusButton(widthOfScreen: CGFloat) -> CGFloat {
        switch self {
        case .zero:
            return (widthOfScreen - 60) / 2
        default: return (widthOfScreen - 60) / 4
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
        GeometryReader { geometry in
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
                                        .frame(width: button.setWidthOfButton(widthOfScreen: geometry.size.width), height: 88)
                                        .foregroundColor(.white)
                                        .background(button.backGroundButton)
                                        .cornerRadius(button.setCornerRadiusButton(widthOfScreen: geometry.size.width))
                                }
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
