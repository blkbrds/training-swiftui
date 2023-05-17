//
//  SimpleList.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 24/04/2023.
//

import SwiftUI

struct SimpleListView: View {

    @State private var isLiked = false
    var body: some View {
//        StaticRowsList()
//        LoopItemsList()
        UserList()

    }
}

struct SimpleList_Previews: PreviewProvider {
    static var previews: some View {
        SimpleListView()
    }
}


