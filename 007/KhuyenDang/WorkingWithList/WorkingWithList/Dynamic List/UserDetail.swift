//
//  UserDetail.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 25/04/2023.
//

import SwiftUI

struct UserDetail: View {

    var user: User

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 20) {
                Image(systemName: "person.fill.viewfinder")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 30)

                Text(user.name)
                    .padding(.leading, 20)
                    .font(.system(size: 25))
                Text(user.address)
                    .padding(.leading, 20)
                    .font(.system(size: 25))
            }
                .padding(.top)
        }
    }
}
