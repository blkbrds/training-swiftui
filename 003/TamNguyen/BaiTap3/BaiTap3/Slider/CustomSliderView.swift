//
//  CustomSliderView.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 16/05/2023.
//

import SwiftUI

struct CustomSliderView: View {
    
    let colorString: String
    let value: Binding<Double>
    
    var body: some View {
        HStack {
            Text("\(colorString)").font(.system(size: 20))
                .multilineTextAlignment(.trailing)
                .padding(.leading)
                .frame(width: 120)
            Slider(value: value, in: 0...255, step: 1)
                .padding(.trailing, 20)
        }
    }
}

