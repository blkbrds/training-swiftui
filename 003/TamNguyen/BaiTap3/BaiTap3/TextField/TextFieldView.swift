//
//  TextFieldView.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 22/05/2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var data: String
    @State var isSecure: Bool = false
    var kind: KindOfInput = .userName
    
    var body: some View {
        switch kind {
        case .userName:
            TextField(kind.toPlaceHolder(), text: $data)
                .textFieldModifier(kind: kind)
        case .password:
            SecureField(kind.toPlaceHolder(), text: $data)
                .textFieldModifier(kind: kind)
        }
    }
}
