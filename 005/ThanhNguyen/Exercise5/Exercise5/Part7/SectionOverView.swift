//
//  SectionOverView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 08/08/2023.
//

import SwiftUI

struct SectionOverView: View {

    var title: String
    var subtitle: String

    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.gray)
            Text(subtitle)
                .font(.system(size: 17, weight: .bold))
        }
    }
}

struct SectionOverView_Previews: PreviewProvider {
    static var previews: some View {
        SectionOverView(title: "Followers", subtitle: "999k")
            .previewLayout(.fixed(width: 150, height: 100))
    }
}
