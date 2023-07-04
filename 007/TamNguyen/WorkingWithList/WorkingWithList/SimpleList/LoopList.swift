//
//  LoopList.swift
//  WorkingWithList
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 28/06/2023.
//

import SwiftUI

struct LoopList: View {
    let usernames = ["Username 1", "Username 2", "Username 3", "Username 4", "Username 5"]
        
        var body: some View {
            List(usernames, id: \.self) { userName in
                Text(userName)
            }
            .listStyle(GroupedListStyle())
        }
}

struct LoopList_Previews: PreviewProvider {
    static var previews: some View {
        LoopList()
    }
}
