//
//  ChangeSizeVIew.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 07/06/2023.
//

import SwiftUI

struct ChangeSizeVIew: View {
    var body: some View {
        VStack(spacing: 30) {
                HStack(spacing: 20) {
                    Rectangle()
                    Rectangle()
                }
                Rectangle()
            }
        .padding(.all, 20)
    }
}

struct ChangeSizeVIew_Previews: PreviewProvider {
    static var previews: some View {
        ChangeSizeVIew()
//            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPhone SE (2nd generation)")
    }
}
