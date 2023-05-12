//
//  ContentView.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 11/05/2023.
//

import SwiftUI

struct ListAvatarView: View {

    let names: [String] = ["Lucas", "Ronaldo", "Messi", "Frank", "Henry", "Lucas1", "Ronaldo2", "Messi1", "Papa"]

    var body: some View {
        VStack {
            ForEach(0..<3) { row in
                HStack {
                    ForEach(0..<3) { column in
                        let index = row*3 + column
                        if index < names.count {
                            VStack {
                                Avatar(name: names[index], id: index)
                            }
                        } else {
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListAvatarView()
    }
}

struct Avatar: View {

    let name: String
    let id: Int
    var body: some View {
        VStack {
            Image("avatar")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(40)
                .onTapGesture {
                print(id)
            }
            Text(name)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .lineLimit(0)
        }
    }
}
