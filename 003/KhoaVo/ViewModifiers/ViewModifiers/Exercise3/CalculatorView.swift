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
    var spacing: CGFloat = 1

    var body: some View {
        VStack(spacing: spacing) {
            Spacer(minLength: 20)
            HStack(spacing: 0) {
                Text("0")
                    .font(.system(size: 80))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                Spacer(minLength: 20)
            }
            .background(Color("color-input"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack(spacing: spacing) {
                ButtonCalculatorView(title: "AC", buttonType: .tools)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(title: "+/-", buttonType: .tools)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(title: "%", buttonType: .tools)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(title: "/", buttonType: .operation)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack(spacing: spacing) {
                ButtonCalculatorView(title: "7", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(title: "8", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(title: "9", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(title: "X", buttonType: .operation)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack(spacing: spacing) {
                ButtonCalculatorView(title: "4", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(title: "5", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(title: "6", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(title: "-", buttonType: .operation)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack(spacing: spacing) {
                ButtonCalculatorView(title: "1", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(title: "2", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(title: "3", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ButtonCalculatorView(title: "+", buttonType: .operation)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack(spacing: spacing) {
                ButtonCalculatorView(title: "0", buttonType: .number)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: spacing) {
                    ButtonCalculatorView(title: ",", buttonType: .number)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    ButtonCalculatorView(title: "=", buttonType: .operation)
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

#Preview {
    CalculatorView()
}
