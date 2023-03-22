//
//  RighBarItem.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/03/2023.
//

import SwiftUI

struct RightBarItem: View {

    var body: some View {
        Rectangle()
            .mask(Circle())
            .foregroundColor(Color(red: 0.875, green: 0.875, blue: 0.875))
            .overlay(
            Image("mark")
                .resizable()
                .frame(width: 25, height: 25)
        )
            .frame(width: 45)
    }
}
