//
//  ShowImageView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 17/02/2023.
//

import SwiftUI

struct ShowImageView: View {
    var body: some View {
        /* Full màn hình với fit & fill mode cho Image
        Image("BackgroundImage")
            .resizable()
            .frame(width: .infinity, height: .infinity)
            .aspectRatio(contentMode: .fill)
        */
        
        /* Full Safe Area
        Image("BackgroundImage")
            .resizable()
            .frame(width: .infinity, height: .infinity)
            .ignoresSafeArea(.all)
            .aspectRatio(contentMode: .fill)
        */
        
        /* Với size cố định cho Image và theo 2 chế độ fit & fill cho ảnh
        Image("BackgroundImage")
            .resizable()
            .frame(width: 300, height: 300)
            .aspectRatio(contentMode: .fit)
        */
        
        /* Bo tròn ảnh / hiên thị ảnh crop hình tròn & hình elip
        Image("BackgroundImage")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Ellipse())
        */
        
        // Hiển thị Text trên ảnh
        Image("BackgroundImage")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Ellipse())
            .overlay {
                Text("TuDeepTry")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
    }
}

struct ShowImageView_Previews: PreviewProvider {
    static var previews: some View {
        ShowImageView()
    }
}
