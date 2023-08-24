//
//  EditProfileView.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 24/08/2023.
//

import SwiftUI

struct EditProfileView: View {

    var type: String
    @Binding var value: String

    var body: some View {
        VStack(spacing: 0) {
            Text(type)
                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray)
            TextField(value, text: $value)
                .font(.system(size: 25, weight: .semibold))
                .padding(.bottom, 5)
                .padding(.top, 10)
            Rectangle()
                .frame(height: 1)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(type: "Nickname", value: .constant("Thanh"))
    }
}
