//
//  CustomRows.swift
//  WorkingWithList
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 28/06/2023.
//

import SwiftUI

struct CustomRows: View {
    let customDatas: [User] = [
            User(imageName: "tam", largeTitle: "Tam Nguyen7", smallTitle: "Mobile Developer"),
            User(imageName: "tien", largeTitle: "Tien Le", smallTitle: "Team Manager"),
            User(imageName: "khuyen", largeTitle: "Khuyen Dang", smallTitle: "Mobile Developer")
        ]

    var body: some View {
        NavigationView {
            List(customDatas, id: \.largeTitle) { item in
                ProfileCell(image: item.imageName, title: item.largeTitle, subTile: item.smallTitle)
            }
                .listStyle(.plain)
                .navigationTitle("List users")
        }
    }
}

struct CustomRows_Previews: PreviewProvider {
    static var previews: some View {
        CustomRows()
    }
}
