//
//  HeaderSectionView.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 19/09/2023.
//

import SwiftUI

struct HeaderSectionView: View {

    let title: String

    var body: some View {
        Text(title)
            .font(.system(size: 30, weight: .bold, design: .rounded))
    }
}

struct HeaderSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderSectionView(title: "Naruto")
    }
}
