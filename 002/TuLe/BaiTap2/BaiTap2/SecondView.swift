//
//  SecondView.swift
//  BaiTap2
//
//  Created by Tu Le C. [2] VN.Danang on 13/02/2023.
//

import SwiftUI

struct SecondView: View {

    let name: String

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, second view")
                .padding()
            Text((name != "") ? name : "...")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
        }
        .padding()
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(name: "")
    }
}
