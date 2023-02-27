//
//  InputCaculatorView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 16/02/2023.
//

import SwiftUI

struct InputCaculatorView: View {

    let size: CGFloat
    let inputName: String

    var body: some View {
        Button  {
            print(inputName)
        } label: {
            if inputName == "0" {
                Text(inputName)
                    .fontWeight(.medium)
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
            } else {
                Text(inputName)
                    .fontWeight(.medium)
                    .font(.system(size: 35))
                    .foregroundColor(.white)
            }
        }
        .frame(width: inputName == "0" ? ((size / 4) * 2 + 14) : (size / 4), height:  size / 4)
        .background {
            switch inputName {
            case "AC", "+/-", "%":
                Color(red: 165 / 255, green: 165 / 255, blue: 165 / 255)
            case "÷", "x", "-", "+", "=":
                Color(red: 254 / 255, green: 159 / 255, blue: 12 / 255)
            default:
                Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255)
            }
        }
        .cornerRadius(size / 8)
    }
}
