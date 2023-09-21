//
//  LoopItemsListView.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 18/09/2023.
//

import SwiftUI

struct LoopItemsListView: View {

    var body: some View {
        List {
            ForEach(0..<10, id: \.self) { i in
                Text("Name \(i)")
                    .font(.title2)
            }
        }
    }
}

struct LoopItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        LoopItemsListView()
    }
}
