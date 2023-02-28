//
//  ImageView.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 21/02/2023.
//

import SwiftUI
struct ImageView: View {

    var body: some View {

        // full screen width fill mode
//        Image("rabbit")
//            .resizable()
//            .scaledToFill()

        // full screen width fit mode
//        Image("rabbit")
//            .resizable()
//            .scaledToFit()

        // set frame width fill mode
//        Image("rabbit")
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 250, height: 250)

        // set frame width fit mode
//        Image("rabbit")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 300, height: 300)

        // circle
//        Image("rabbit")
//            .resizable()
//            .scaledToFit()
//            .clipShape(Circle())
        
        // elip
//        Image("rabbit")
//            .resizable()
//            .scaledToFit()
//            .mask(Ellipse())
        
        // show text above image
//        Image("image1")
//            .resizable()
//            .scaledToFit()
//            .mask(Text("Khuyen")
//                .fontWeight(.black)
//                .font(.system(size: 70)))
       
        Image("rabbit")
            .resizable()
            .scaledToFit()
            .mask(Circle())
            .overlay(
            Text("❤️")
                .offset(x: UIScreen.main.bounds.width / 4, y: UIScreen.main.bounds.height / 8)
                .font(.system(size: 50))
        )
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
