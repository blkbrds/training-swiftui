//
//  SimpleList1.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 25/04/2023.
//

import SwiftUI

struct SimpleList1: View {

    var body: some View {
        List {
            Text("Item1")
                .font(.system(size: 13))
            Text("SwiftUI")
                .font(.system(.title, weight: .bold))
            Button {
                print("")
            } label: {
                Text("Button")
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
        }
    }
}

struct SimpleList1_Previews: PreviewProvider {
    static var previews: some View {
        SimpleList1()
    }
}
