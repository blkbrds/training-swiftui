//
//  ImageView.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
            ZStack {
                Image("M10")
                    .resizable()
    //                .ignoresSafeArea()
    //                .aspectRatio(contentMode: .fit)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .cornerRadius(50)
                    .overlay(
                        Text("G.O.A.T")
                            .italic()
                            .font(.title)
                            .foregroundColor(Color.blue)
                            .padding([.bottom, .trailing], 180)
                            .opacity(0.9),
                             alignment: .bottomTrailing
                        )
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
