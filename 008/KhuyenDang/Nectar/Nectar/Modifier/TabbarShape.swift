//
//  TabbarShape.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 09/05/2023.
//

import SwiftUI

struct TabbarShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in

            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))

            let center = rect.width / 2
            path.move(to: CGPoint(x: center - 70, y: 0))

            let to1 = CGPoint(x: center, y: 40)
            let control1 = CGPoint(x: center - 40, y: 0)
            let control2 = CGPoint(x: center - 40, y: 40)

            let to2 = CGPoint(x: center + 70, y: 0)
            let control3 = CGPoint(x: center + 40, y: 40)
            let control4 = CGPoint(x: center + 40, y: 0)

            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}

