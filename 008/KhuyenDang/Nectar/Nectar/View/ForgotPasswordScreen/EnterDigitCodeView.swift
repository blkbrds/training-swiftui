//
//  EnterDigitCodeView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/05/2023.
//

import SwiftUI
import Combine

struct EnterDigitCodeView: View {

    enum FocusField: Hashable {
        case field
    }

    @FocusState private var focusedField: FocusField?
    @Binding var otpCode: String
    @Binding var otpCodeLength: Int

    public var body: some View {
        HStack {
            ZStack(alignment: .center) {
                TextField("", text: $otpCode)
                    .frame(width: 0, height: 0, alignment: .center)
                    .font(Font.system(size: 0))
                    .accentColor(.clear)
                    .foregroundColor(.clear)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .onReceive(Just(otpCode)) { _ in limitText(otpCodeLength) }
                    .focused($focusedField, equals: .field)
                    .task {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                    {
                        self.focusedField = .field
                    }
                }
                    .padding()
                HStack {
                    ForEach(0..<otpCodeLength, id: \.self) { index in
                        ZStack {
                            Text(self.getPin(at: index))
                                .font(Font.system(size: 27))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)

                            Rectangle()
                                .frame(width: 40, height: 50)
                                .foregroundColor(Color("green"))
                                .opacity(0.2)
                                .cornerRadius(10)
                                .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("green"), lineWidth: 1)
                                    .opacity(self.otpCode.count <= index ? 0 : 1)
                            )
                                .padding(.trailing, 5)
                                .padding(.leading, 5)
                        }
                    }
                }
            }
        }
    }

    private func getPin(at index: Int) -> String {
        guard self.otpCode.count > index else {
            return ""
        }
        return self.otpCode[index]
    }

    private func limitText(_ upper: Int) {
        if otpCode.count > upper {
            otpCode = String(otpCode.prefix(upper))
        }
    }
}

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}
