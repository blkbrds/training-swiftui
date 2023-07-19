//
//  CustomTextField.swift
//  Exercise4
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 19/07/2023.
//

import SwiftUI

struct CustomTextField: View {

    @Binding var value: Int

    var body: some View {
        HStack {
            Text("Value: ")
                .font(.system(size: 25, weight: .heavy, design: .monospaced))
            TextField("0", value: $value, format: .number)
                .padding(10)
                .multilineTextAlignment(.center)
                .font(.system(size: 25, weight: .bold, design: .monospaced))
                .overlay {
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke()
                }
                .keyboardType(.numberPad)
                .onChange(of: value) { newValue in
                    if newValue > 100 {
                        value = 100
                    } else if newValue < 0 {
                        value = 0
                    }
                }
        }
        .frame(maxHeight: 100)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(value: .constant(0))
    }
}
