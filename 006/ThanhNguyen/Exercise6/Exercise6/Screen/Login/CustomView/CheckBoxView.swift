//
//  CheckBoxView.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 29/08/2023.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor( checked ? .blue : .secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}
