//
//  AvatarView.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 15/02/2023.
//

import SwiftUI

struct AvatarView: View {

    @State var name = "Khuyen"
    var body: some View {
        VStack {
            Image("rabbit")
                .resizable()
                .clipShape(Circle())
                .frame(width: 150, height: 150, alignment: .center)
                .scaledToFill()
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .onTapGesture {
                print(name)
            }
                .shadow(radius: 5)
            Text(name)
                .padding()
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
