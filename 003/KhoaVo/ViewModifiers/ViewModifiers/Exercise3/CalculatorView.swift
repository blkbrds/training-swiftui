//
//  CalculatorView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 21/06/2023.
//

import SwiftUI

enum CalculatorButtonType {
    case tools
    case operation
    case number

    var backgroundColor: Color {
        switch self {
        case .tools:
            return Color("color-tools")
        case .operation:
            return Color("color-operation")
        case .number:
            return Color("color-numbers")
        }
    }
}

struct CalculatorView: View {

    @State var input: String = ""
    private var spacing: CGFloat = 1
    private var isNumber: Bool {
        return Int(input) != nil
    }

    var body: some View {
        VStack(spacing: spacing) {
            Spacer(minLength: 20)
            HStack(spacing: 0) {
                Text(isNumber ? "\(input)" : "0")
                    .font(.system(size: 80))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                Spacer(minLength: 20)
            }
            .background(Color("color-input"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack(spacing: spacing) {
                ButtonCalculatorView(input: $input, title: "AC", buttonType: .tools)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(input: $input, title: "+/-", buttonType: .tools)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(input: $input, title: "%", buttonType: .tools)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(input: $input, title: "/", buttonType: .operation)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack(spacing: spacing) {
                ButtonCalculatorView(input: $input, title: "7", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(input: $input, title: "8", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(input: $input, title: "9", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(input: $input, title: "X", buttonType: .operation)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack(spacing: spacing) {
                ButtonCalculatorView(input: $input, title: "4", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(input: $input, title: "5", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(input: $input, title: "6", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(input: $input, title: "-", buttonType: .operation)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack(spacing: spacing) {
                ButtonCalculatorView(input: $input, title: "1", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(input: $input, title: "2", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(input: $input, title: "3", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(input: $input, title: "+", buttonType: .operation)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack(spacing: spacing) {
                ButtonCalculatorView(input: $input, title: "0", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: spacing) {
                    ButtonCalculatorView(input: $input, title: ",", buttonType: .number)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    ButtonCalculatorView(input: $input, title: "=", buttonType: .operation)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .background(.clear)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

