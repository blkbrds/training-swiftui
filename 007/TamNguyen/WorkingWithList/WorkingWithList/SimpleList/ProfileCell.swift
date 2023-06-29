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
            Image(image)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                Text(subTile)
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
        ProfileCell(image: "", title: "", subTile: "")
    }
}
