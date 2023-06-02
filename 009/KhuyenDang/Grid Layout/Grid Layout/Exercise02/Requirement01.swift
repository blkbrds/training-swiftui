//
//  Requirement01.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/05/2023.
//

import SwiftUI

struct Requirement01: View {

    var body: some View {
        Grid {
            GridRow {
                Item(color: .yellow, image: "globe.europe.africa")
                Item(color: .yellow, image: "globe.europe.africa")
            }
            GridRow {
                Item(color: .yellow, image: "globe.europe.africa")
                Item(color: .yellow, image: "globe.europe.africa")
            }
        }
            .frame(height: 200)
    }
}

struct Item: View {

    let color: Color
    let image: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(color)
            Image(systemName: image)
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}

struct Requirement01_Previews: PreviewProvider {
    static var previews: some View {
        Requirement01()
    }
}
