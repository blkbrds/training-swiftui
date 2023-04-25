//
//  StaticRowsList.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 24/04/2023.
//

import SwiftUI

struct StaticRowsList: View {

    @State private var isLiked = false

    var body: some View {
        List {
            Text("SwiftUI")
                .font(.title2)
            Image("icon_swiftUI")
            HeartButton(isLiked: $isLiked)
            Text("Item 4")
            Text("Item 5")
        }
    }
}

struct StaticRowsList_Previews: PreviewProvider {
    static var previews: some View {
        StaticRowsList()
    }
}
