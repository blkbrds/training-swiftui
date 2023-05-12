//
//  ImageView.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 12/05/2023.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("avatar")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
