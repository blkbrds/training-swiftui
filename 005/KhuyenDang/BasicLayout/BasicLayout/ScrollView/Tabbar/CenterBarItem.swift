//
//  CenterBarItem.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/03/2023.
//

import SwiftUI

struct CenterBarItem: View {

    var body: some View {
        Rectangle()
            .mask(Circle())
            .foregroundColor(Color(red: 0.999, green: 0.476, blue: 0.474))
            .overlay(
            Image("scan")
                .resizable()
                .frame(width: 25, height: 25)
        )
            .frame(width: 70)
    }
}
