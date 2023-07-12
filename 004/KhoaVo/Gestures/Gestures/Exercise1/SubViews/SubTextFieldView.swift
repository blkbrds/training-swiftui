//
//  SubTextFieldView.swift
//  Gestures
//
//  Created by Khoa Vo T.A. VN.Danang on 10/07/2023.
//

import SwiftUI

struct SubTextFieldView: View {

    @Binding var value: Int

    var body: some View {
        HStack(spacing: 30) {
            Spacer()
            Text("Current value: ")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color("SliderMainColor"))

            TextField("0", value: $value, format: .number)
                .padding(2)
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .foregroundColor(Color("SliderMainColor"))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color("SliderMainColor"))
                )
                .frame(width: 70)
                .tint(Color("SliderMainColor"))
                .onChange(of: value) { newValue in
                    if newValue > 100 || newValue < 0 {
                        value = 0
                    }
                }
            Spacer()
        }
        .padding()
    }
}
