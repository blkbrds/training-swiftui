//
//  Requirement02.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/05/2023.
//

import SwiftUI

struct Requirement02: View {

    var body: some View {
        Grid {
            GridRow {
                Item(color: .yellow, image: "globe.europe.africa")
                Item(color: .yellow, image: "globe.europe.africa")
            }
            GridRow {
                Item(color: .yellow, image: "globe.europe.africa")
                    .gridCellColumns(2)
            }
        }
            .frame(height: 200)
    }
}

struct Requirement02_Previews: PreviewProvider {
    static var previews: some View {
        Requirement02()
    }
}
