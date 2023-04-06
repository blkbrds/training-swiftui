//
//  MySquareView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/03/2023.
//

import SwiftUI

enum TypeSquare {
    case green
    case purple
    case yellow
    case orange
    
    func color() -> Color {
        switch self {
        case .green:
            return (.green)
        case .purple:
            return (.purple)
        case .yellow:
            return (.yellow)
        case .orange:
            return (.orange)
        }
    }
}

struct MySquareView: View {
 
    var height: CGFloat
    var type: TypeSquare = .green
    var typeZoom: TypeSquare = .green
    var body: some View {
        
        if type == typeZoom {
            Rectangle()
                .foregroundColor(type.color())
                .frame(width: height * 2, height: height * 2)
        } else {
            Rectangle()
                .foregroundColor(type.color())
                .frame(width: height, height: height)
        }
    }
}
