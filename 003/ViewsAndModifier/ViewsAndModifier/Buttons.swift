//
//  Buttons.swift
//  ViewsAndModifier
//
//  Created by Khuyen Dang T.T. VN.Danang on 23/02/2023.
//

import SwiftUI

struct Buttons: View {
    
    var body: some View {
        VStack(spacing: 30) {
            ButtonView(icon: "cart", title: "BUY NOW", subtitle: "Thinking")
            ButtonView(icon: "cart", title: "BUY NOW")
            ButtonView(title: "BUY NOW")
        }
    }
}
struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
