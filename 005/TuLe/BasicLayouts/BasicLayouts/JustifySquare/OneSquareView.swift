//
//  OneSquareView.swift
//  BasicLayouts
//
//  Created by Tu Le C. [2] VN.Danang on 15/03/2023.
//

import SwiftUI

struct OneSquareView: View {

    var sizeWidthScreen: CGFloat = UIScreen.main.bounds.width

    var body: some View {
        SquaresView(amount: 1)
    }
}

struct OneSquareView_Previews: PreviewProvider {
    static var previews: some View {
        OneSquareView()
    }
}
