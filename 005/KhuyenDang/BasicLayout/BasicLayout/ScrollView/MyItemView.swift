//
//  MyItemView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 21/03/2023.
//

import SwiftUI

struct MyItemView: View {

    @State var name: String

    var body: some View {
        Image(name)
            .resizable()
            .frame(width: 250, height: 200)
            .scaledToFit()
            .cornerRadius(10)
            .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.pink, lineWidth: 1)
        )
    }
}
