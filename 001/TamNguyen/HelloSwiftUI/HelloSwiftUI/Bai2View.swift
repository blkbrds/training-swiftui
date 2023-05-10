//
//  Bai2View.swift
//  HelloSwiftUI
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 10/05/2023.
//

import SwiftUI

struct Bai2View: View {
    let name: String

    var body: some View {
        VStack {
            Text("Hello World")
                .padding()
            Text((name != "") ? name : "---")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
        }
    }
}

struct Bai2View_Previews: PreviewProvider {
    static var previews: some View {
        Bai2View(name: "Thien Tam")
    }
}
