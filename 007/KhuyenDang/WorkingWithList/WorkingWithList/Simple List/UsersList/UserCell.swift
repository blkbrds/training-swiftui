//
//  UserCell.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 24/04/2023.
//

import SwiftUI

struct UserCell: View {

    let user: User
    var body: some View {
        HStack() {
            Image(systemName: "person.crop.circle")
                .resizable()
                .foregroundColor(.green)
                .frame(width: 50, height: 50)
            Spacer()
                .frame(width: 20)
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.title2)
                Text(user.address)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button(action: { },
                label: {
                    Image(systemName: "chevron.forward")
                        .foregroundColor(.green)
                })
                .buttonStyle(PlainButtonStyle())
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
