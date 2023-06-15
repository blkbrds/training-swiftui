//
//  ColorExt.swift
//  HelloSwiftUI
//
//  Created by Khoa Vo T.A. VN.Danang on 15/06/2023.
//

import SwiftUI

extension Color {

    static func random() -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
