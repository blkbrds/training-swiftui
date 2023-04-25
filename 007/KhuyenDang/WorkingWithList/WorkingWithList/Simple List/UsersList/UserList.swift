//
//  UserList.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 24/04/2023.
//

import SwiftUI

struct UserList: View {

    @StateObject private var viewModel = LoopItemsViewModel()

    var body: some View {
        List {
            ForEach(viewModel.users, id: \.name) { user in
                UserCell(user: user)
                    .listRowSeparator(.hidden)
            }
        }
            .listStyle(.plain)
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
