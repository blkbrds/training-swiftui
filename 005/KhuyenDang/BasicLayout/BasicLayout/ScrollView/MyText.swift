//
//  MyText.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 21/03/2023.
//

import SwiftUI

struct MyText: View {

    @State var value: String

    var body: some View {
        Text(value)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color(red: 0.292, green: 0.204, blue: 0.149))
    }
}

