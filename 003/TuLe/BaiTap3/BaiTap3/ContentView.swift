//
//  ContentView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 15/02/2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            ForEach(0..<3) { i in
                ListAvatarView(list: [i * 3 + 1, i * 3 + 2, i * 3 + 3])
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AvatarView: View {

    var name: String

    var body: some View {
        VStack {
            Image("no-avatar")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .clipShape(Circle())
                .padding()
                .background(Color.brown)
                .clipShape(Circle())
                .shadow(radius: 20)
                .onTapGesture {
                    print(name)
                }
            Text(name)
                .font(.title)
                .multilineTextAlignment(.center)
        }
    }
}

struct ListAvatarView: View {
    var list: [Int]
    var body: some View {
        HStack {
            ForEach(list, id: \.self) { item in
                AvatarView(name: "Tú \(item)")
            }
        }
    }
}
