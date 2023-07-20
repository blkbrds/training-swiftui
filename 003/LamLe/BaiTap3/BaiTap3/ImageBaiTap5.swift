//
//  ImageBaiTap5App.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/10/23.
//

import SwiftUI

struct ImageBaiTap5App: View {
    var body: some View {
        ZStack {
            Image("GOKU")
                .resizable()
//                .ignoresSafeArea()
//                .aspectRatio(contentMode: .fit)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .cornerRadius(50)
                .overlay(
                    Text("Tao mạnh nhất")
                        .italic()
                        .font(.title)
                        .foregroundColor(Color.gray)
                        .padding([.bottom, .trailing], 40)
                        .opacity(0.9),
                         alignment: .bottomTrailing
                    )
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct ImageBaiTap5App_Previews: PreviewProvider {
    static var previews: some View {
        ImageBaiTap5App()
    }
}
