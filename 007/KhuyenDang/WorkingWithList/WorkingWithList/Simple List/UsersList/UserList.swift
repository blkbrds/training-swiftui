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
        NavigationView {
            List(viewModel.users) { user in
                UserCell(user: user)
                    .listRowSeparator(.hidden)
                    .overlay(
                    NavigationLink(destination: UserDetail(user: user), label: {
                            EmptyView()
                        })
                        .opacity(0)
                )
                    .listRowBackground(Color.white)
            }
                .listStyle(.plain)
                .navigationTitle("List users")
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
