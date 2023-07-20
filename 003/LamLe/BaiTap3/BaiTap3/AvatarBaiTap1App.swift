//
//  AvatarBaiTap1App.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/20/23.
//

import SwiftUI

struct AvatarBaiTap1App: View {
    var body: some View {
        VStack {
            Image("jessieLee")
                .resizable(capInsets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .clipShape(Circle())
                .foregroundColor(.gray)
                .padding(0)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Jessie Lee" )
                }
            Text("Jessie Lee")
                .foregroundColor(.pink)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

struct AvatarBaiTap1App_Previews: PreviewProvider {
    static var previews: some View {
        AvatarBaiTap1App()
    }
}
