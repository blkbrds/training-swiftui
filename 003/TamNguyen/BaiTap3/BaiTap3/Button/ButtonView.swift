//
//  ButtonView.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 22/05/2023.
//

import SwiftUI

struct ButtonView: View {
    
    var titleButton: String
    var actionButton: () -> Void
    
    var body: some View {
        Button {
            actionButton()
        } label: {
            Text(titleButton)
                .foregroundColor(.white)
        }
        .submitButtonModifier()
    }
}
