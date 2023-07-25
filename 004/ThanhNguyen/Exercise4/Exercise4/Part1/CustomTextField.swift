//
//  CustomTextField.swift
//  Exercise4
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 19/07/2023.
//

import SwiftUI

struct CustomTextField: View {

    @Binding var value: Int
    @State var testValue: Int = 0
    public var didAppear: ((Self) -> Void)?

    var body: some View {
        ZStack {
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
                        value = min(max(newValue, 0), 100)
                    }
            }
            .frame(maxHeight: 100)
            Button("Change text test") {
                if value < 0 {
                    testValue = 0
                } else if value > 100 {
                    testValue = 100
                }
            }
            .frame(width: 0, height: 0)
            .onAppear {
                self.didAppear?(self)
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(value: .constant(0))
    }
}
