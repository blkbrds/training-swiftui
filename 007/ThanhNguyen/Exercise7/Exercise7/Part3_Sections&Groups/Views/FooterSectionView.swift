//
//  FooterSectionView.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 19/09/2023.
//

import SwiftUI

struct FooterSectionView: View {

    let title: String

    var body: some View {
        Text(title)
    }
}

struct FooterSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FooterSectionView(title: "Naruto")
    }
}
