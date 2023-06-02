//
//  Requirement03.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/05/2023.
//

import SwiftUI

struct Requirement03: View {
    var body: some View {
        Grid {
            Group {
                GridRow {
                    Group {
                        Item(color: .blue, image: "pawprint")
                        Item(color: .yellow, image: "sun.haze")
                    }
                        .gridCellColumns(2)
                    Item(color: .mint, image: "cloud.rain")
                    Item(color: .red, image: "thermometer.sun.fill")
                }
                Item(color: .cyan, image: "drop")
                GridRow {
                    Item(color: .yellow, image: "fish")
                        .gridCellColumns(2)
                    Item(color: .orange, image: "carrot")
                        .gridCellColumns(4)
                }
            }
                .frame(height: 100)
            Item(color: .pink, image: "lizard")
                .frame(height: 200)
        }
    }
}

struct Requirement03_Previews: PreviewProvider {
    static var previews: some View {
        Requirement03()
    }
}
