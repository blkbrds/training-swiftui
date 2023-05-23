//
//  TextFieldView.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 22/05/2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var data: String
    @Binding var isSecure: Bool
    var kind: KindOfInput = .userName
    
    var body: some View {
        switch kind {
        case .userName:
            TextField(kind.toPlaceHolder(), text: $data)
                .textFieldModifier(kind: kind)
        case .password:
            if isSecure {
                SecureField(kind.toPlaceHolder(), text: $data)
                    .textFieldModifier(kind: kind)
            } else {
                TextField(kind.toPlaceHolder(), text: $data)
                    .textFieldModifier(kind: kind)
            }
        }
    }
}
