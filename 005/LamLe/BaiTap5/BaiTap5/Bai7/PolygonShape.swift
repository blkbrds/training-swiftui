//
//  PolygonShape.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/24/23.
//

import SwiftUI

struct PolygonShape: Shape {
    let height: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 125))
            path.addLine(to: CGPoint(x: 0, y: rect.height - height))
        }
    }
}

struct PolygonShape_Previews: PreviewProvider {
    static var previews: some View {
        PolygonShape(height: 70)
    }
}





