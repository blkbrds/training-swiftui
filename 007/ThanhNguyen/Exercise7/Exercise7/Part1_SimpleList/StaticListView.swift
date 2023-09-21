//
//  StaticListView.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 18/09/2023.
//

import SwiftUI

struct StaticListView: View {

    var body: some View {
        List {
            Image(systemName: "swift")
                .imageScale(.large)
            Text("SwiftUI")
                .font(.largeTitle)
            Button("Button") {
                print("Tap button")
            }
            Text("Row 1")
            Text("Row 2")
        }
    }
}

struct StaticListView_Previews: PreviewProvider {
    static var previews: some View {
        StaticListView()
    }
}
