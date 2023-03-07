//
//  MySliderView.swift
//  Gesture
//
//  Created by Khuyen Dang T.T. VN.Danang on 27/02/2023.
//

import SwiftUI

struct MySliderView: View {

    @State private var value = "0"

    var body: some View {

        VStack(spacing: 80) {
            MyTextField(value: $value)
            MySlider(value: $value)
        }
    }
}

struct MySliderView_Previews: PreviewProvider {
    static var previews: some View {
        MySliderView()
    }
}
