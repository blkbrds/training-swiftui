//
//  MySliderView.swift
//  Exercise4
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 18/07/2023.
//

import SwiftUI

struct Background<Content: View>: View {
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        GeometryReader { geo in
            Color.white
                .frame(width: geo.size.width,
                       height: geo.size.height)
                .overlay(content)
        }
    }
}

struct MySliderView: View {

    @State var value: Int = 0

    var body: some View {
        Background {
            VStack {
                CustomTextField(value: $value)
                    .padding([.leading, .trailing, .bottom], 50)
                CustomSlider(value: $value)
                    .padding(.bottom, 50)
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct MySliderView_Previews: PreviewProvider {
    static var previews: some View {
        MySliderView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
