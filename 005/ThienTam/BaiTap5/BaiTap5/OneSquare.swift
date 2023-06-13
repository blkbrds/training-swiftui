//
//  OneSquare.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 07/06/2023.
//

import SwiftUI

struct OneSquare: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 200, height: 200)
        }
    }
}

struct OneSquare_Previews: PreviewProvider {
    static var previews: some View {
        OneSquare()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
