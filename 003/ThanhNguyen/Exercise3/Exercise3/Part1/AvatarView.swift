//
//  AvatarView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 04/07/2023.
//

import SwiftUI

struct AvatarView: View {

    private let name: String = "カイドウ"

    var body: some View {
        VStack {
            Image("img_kaido")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 300, maxHeight: 300)
                .cornerRadius(.infinity)
                .onTapGesture {
                    print("Name: -->", name)
                }
            VStack(spacing: 10) {
                Text(name)
                    .multilineTextAlignment(.center)
                    .font(.system(
                        size: 35,
                        weight: .heavy,
                        design: .monospaced)
                    )
            }
        }
        .padding()
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
