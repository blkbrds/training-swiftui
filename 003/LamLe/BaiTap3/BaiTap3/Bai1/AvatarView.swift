//
//  AvatarView.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct AvatarView: View {
    
    private var name: String = "Leo Messi"
    
    var body: some View {
        VStack {
            Image("M10")
                .resizable(capInsets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .clipShape(Circle())
                .padding(0)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("His Name is : \(name)" )
                }
            Text(name)
                .foregroundColor(.blue.opacity(0.6))
                .font(.title)
                .fontWeight(.bold)
            }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
