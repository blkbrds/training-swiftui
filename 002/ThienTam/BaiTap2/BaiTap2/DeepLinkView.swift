//
//  DeepLinkView.swift
//  BaiTap2
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 21/05/2023.
//

import SwiftUI

struct DeepLinkView: View {

    let name: String

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Text((name != "") ? name : "---")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
        }
    }
}
