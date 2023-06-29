//
//  CustomRows.swift
//  WorkingWithList
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 28/06/2023.
//

import SwiftUI

struct CustomRows: View {
    let customDatas: [User] = [
            User(imageName: "photo", largeTitle: "Title 1", smallTitle: "Subtitle 1"),
            User(imageName: "photo.fill", largeTitle: "Title 2", smallTitle: "Subtitle 2"),
            User(imageName: "photo.on.rectangle", largeTitle: "Title 3", smallTitle: "Subtitle 3")
        ]

    var body: some View {
        NavigationView {
            List(customDatas, id: \.largeTitle) { item in
                ProfileCell()
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
