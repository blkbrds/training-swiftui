//
//  ItemView.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 08/06/2023.
//

import SwiftUI

struct ItemView: View {
    
    var contentTitle: String

    var body: some View {
        Rectangle()
            .frame(width: 200, height: 250)
            .cornerRadius(20)
            .overlay {
                Image("bear")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(contentTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
    }
}
