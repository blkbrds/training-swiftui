//
//  ImageContentView.swift
//  Exercise3
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 06/07/2023.
//

import SwiftUI

struct ImageContentView: View {

    var body: some View {
        VStack {
            /// Full screen `fit` & `fill`
            /*
             Image("img_kaido")
             .resizable()
             .frame(maxWidth: .infinity, maxHeight: .infinity)
             .scaledToFit()

             Image("img_kaido")
             .resizable()
             .frame(maxWidth: .infinity, maxHeight: .infinity)
             .scaledToFill()
             */

            /// Full `Safe Area`
            /*
             Image("img_kaido")
             .resizable()
             .frame(maxWidth: .infinity, maxHeight: .infinity)
             .edgesIgnoringSafeArea(.all)
             .scaledToFill()
             */

            /// Fixed size `fit` & `fill`
            /*
             Image("img_kaido")
             .resizable()
             .frame(width: 300, height: 150)
             .scaledToFill()

             Image("img_kaido")
             .resizable()
             .frame(width: 300, height: 150)
             .scaledToFit()
             */

            /// `Circle`
            /*
             Image("img_kaido")
             .resizable()
             .scaledToFit()
             .clipShape(Circle())
             */

            /// `Ellipse`
            /*
             Image("img_kaido")
             .resizable()
             .scaledToFit()
             .clipShape(Ellipse())
             */

            /// Show text above image
            Image("img_kaido")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay {
                    Text("Kaido")
                        .font(.system(size: 30, weight: .heavy, design: .serif))
                        .foregroundColor(.white)
                }
        }
    }
}

struct ImageContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageContentView()
    }
}
