//
//  DynamicListView.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 27/04/2023.
//

import SwiftUI

struct DynamicListView: View {
    var users = UserInsta.dummyData()
    var body: some View {
        NavigationStack {
            List(users) { item in
                NavigationLink {
                    DynamicListDetail(user: item)
                } label: {
                    UserInstaRow(user: item)
                }
            }
            .navigationBarTitle("DynamicList")
        }
    }
}

struct DynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicListView()
    }
}

struct UserInstaRow: View {
    var user: UserInsta
    
    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                HStack {
                    Text(user.nickname)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                    if user.isBlueTick {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)
                    }
                }
                Text(user.name)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
    }
}
