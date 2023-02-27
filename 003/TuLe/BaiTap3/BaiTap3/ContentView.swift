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
                HStack(spacing: 5) {
                    AvatarView(name: "Tú \(i * 3 + 1)")
                    AvatarView(name: "Tú \(i * 3 + 2)")
                    AvatarView(name: "Tú \(i * 3 + 3)")
                }
                .frame(maxWidth: .infinity ,alignment: .leading)
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
    let widthAvatar = (UIScreen.main.bounds.width - 40) / 3

    var body: some View {
        VStack {
            Image("no-avatar")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .clipShape(Circle())
                .padding()
                .frame(maxWidth: widthAvatar)
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
