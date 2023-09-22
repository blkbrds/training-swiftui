//
//  MySliderView.swift
//  Gestures
//
//  Created by Khoa Vo T.A. VN.Danang on 04/07/2023.
//

import SwiftUI

struct MySliderView: View {

    @State private var value: Int = 0

    var body: some View {

        VStack(spacing: 50) {
            Spacer()
            SubTextFieldView(value: $value)
            SubSliderView(value: $value)
            Spacer()
        }
    }
}

struct MySliderView_Previews: PreviewProvider {
    static var previews: some View {
        MySliderView()
    }
}
