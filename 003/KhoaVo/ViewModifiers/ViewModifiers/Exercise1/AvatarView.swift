//
//  AvatarView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 20/06/2023.
//

import SwiftUI

struct AvatarView: View {

    @State var name: String = "Uchiha Itachi"

    var body: some View {
        VStack {
            Image("img-itachi")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .cornerRadius(20)
                .onTapGesture {
                    print("\(name)")
                }
                .shadow(radius: 10, x: 10, y: 10)
            Text("\(name)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.brown)
                .padding()
        }
        .padding()
    }
}

#Preview {
    AvatarView()
}
