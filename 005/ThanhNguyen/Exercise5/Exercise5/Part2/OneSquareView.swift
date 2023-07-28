//
//  OneSquareView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 28/07/2023.
//

import SwiftUI

struct OneSquareView: View {

    var body: some View {
        Rectangle()
            .frame(width: 100, height: 100)
    }
}

struct OneSquareView_Previews: PreviewProvider {
    static var previews: some View {
        OneSquareView()
    }
}
