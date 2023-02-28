//
//  CalculatorView.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 17/02/2023.
//

import SwiftUI

struct CalculatorView: View {

    let buttons = [
        ["AC", "*/_", "%", "/"],
        ["7", "8", "9", "X"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ",", "="]
    ]

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("0")
                    .font(.system(size: 60))
                    .padding(.trailing, 30)
            }
            VStack {
                let height = (UIScreen.main.bounds.width - 5 * 12) / 4
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { button in
                            let width = widthForButton(button)
                            Button(action: {
                                print(button)
                            }) {
                                Text(button)
                                    .font(.system(size: 30).bold())
                                    .foregroundColor(colorForButton(button).foreground)
                                    .frame(width: width, height: height)
                            }
                                .background(colorForButton(button).background)
                                .cornerRadius(height / 2)
                        }
                    }
                }
            }
        }
    }

    private func widthForButton(_ button: String) -> CGFloat {
        if button == "0" {
            return (UIScreen.main.bounds.width - 4 * 12) / 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }

    private func colorForButton(_ button: String) -> (foreground: Color, background: Color) {
        switch button {
        case "AC", "*/_", "%":
            return (.black, Color(red: 0.627, green: 0.627, blue: 0.627))
        case "/", "X", "-", "+", "=":
            return (.white, Color(red: 0.965, green: 0.599, blue: 0.023))
        default:
            return (.white, Color(red: 0.192, green: 0.192, blue: 0.192))
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
