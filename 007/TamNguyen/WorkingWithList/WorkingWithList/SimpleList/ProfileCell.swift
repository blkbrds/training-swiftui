//
//  ProfileCell.swift
//  WorkingWithList
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 28/06/2023.
//

import SwiftUI

struct ProfileCell: View {
    
    var image: String
    var title: String
    var subTile: String

    var body: some View {
        HStack {
            Image(systemName: "photo")
                .font(.title)

            VStack(alignment: .leading) {
                Text("Thien Tam")
                    .font(.title)
                Text("Mobile Developer")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

struct ProfileCell_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCell()
    }
}
