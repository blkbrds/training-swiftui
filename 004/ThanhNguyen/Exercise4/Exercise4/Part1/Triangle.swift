//
//  Triangle.swift
//  Exercise4
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 18/07/2023.
//

import SwiftUI

struct Triangle: View {

    enum Direction: Double {
        case down = 0
        case left = 90
        case up = 180
        case right = 270
    }

    let direction: Direction
    let color: Color

    init(_ direction: Direction = .down, _ color: Color = .black) {
        self.direction = direction
        self.color = color
    }

    var body: some View {
        TriangleShape()
            .fill(color)
            .rotationEffect(Angle.degrees(direction.rawValue))
    }

    struct TriangleShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()

            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

            return path
        }
    }
}
