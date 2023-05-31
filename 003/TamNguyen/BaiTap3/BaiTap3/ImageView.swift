//
//  ImageView.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 12/05/2023.
//

import SwiftUI

struct ImageView: View {
    var body: some View {

        // fill
//        Image("avatar")
//            .resizable()
//            .scaledToFill()
//            .edgesIgnoringSafeArea(.all)

        // fit
//        Image("avatar")
//            .resizable()
//            .scaledToFit()
//            .edgesIgnoringSafeArea(.all)

        // circle
        Image("avatar")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())

        // elip
        //        Image("rabbit")
        //            .resizable()
        //            .scaledToFit()
        //            .mask(Ellipse())

        // show text above image
        //        Image("avatar")
        //            .resizable()
        //            .scaledToFit()
        //            .mask(Text("Khuyen")
        //                .fontWeight(.black)
        //                .font(.system(size: 70)))

//         set frame with fill
//        Image("avatar")
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 250, height: 250)

//         set frame with fit
//        Image("avatar")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 300, height: 300)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
