//
//  CustomSquareView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 31/07/2023.
//

import SwiftUI

struct CustomSquareView: View {

    @Binding var selectType: Color
    var colorType: Color
    var width: CGFloat

    var body: some View {
        let width: CGFloat = selectType == colorType ? width * 2 : width
        Rectangle()
            .frame(width: width, height: width)
            .foregroundColor(colorType)
    }
}

struct CustomSquareView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSquareView(selectType: .constant(.green), colorType: .green, width: 100)
    }
}

