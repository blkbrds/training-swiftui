//
//  MyTextField.swift
//  Gesture
//
//  Created by Khuyen Dang T.T. VN.Danang on 01/03/2023.
//

import SwiftUI

struct MyTextField: View {

    @Binding var value: String

    var body: some View {

        HStack(spacing: 30) {
            Spacer()
            Text("Value")
                .font(.system(size: 40, weight: .medium))

            TextField("0", text: $value)
                .padding(5)
                .multilineTextAlignment(.center)
                .font(.system(size: 30))
                .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke()
            )
                .frame(width: 100)
                .keyboardType(.numberPad)
                .onChange(of: value) { newValue in
                if let newValue = Int(newValue), newValue > 100 || newValue < 0 {
                    value = "0"
                }
            }
            Spacer()
        }
            .padding()
    }

}
