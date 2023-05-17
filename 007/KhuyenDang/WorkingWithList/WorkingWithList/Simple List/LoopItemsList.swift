//
//  LoopItemsList.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 24/04/2023.
//

import SwiftUI

struct LoopItemsList: View {

    @StateObject private var viewModel = LoopItemsViewModel()

    var body: some View {
        List {
            ForEach(viewModel.users, id: \.name) { user in
                Text(user.name)
            }
        }
    }
}

struct LoopItemsList_Previews: PreviewProvider {
    static var previews: some View {
        LoopItemsList()
    }
}
