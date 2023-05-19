//
//  SimpleList2.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 26/04/2023.
//

import SwiftUI

struct SimpleList2: View {
    var body: some View {
        List {
            ForEach(0 ..< 10) { i in
                Text("Username \(i + 1)")
            }
        }
    }
}

struct SimpleList2_Previews: PreviewProvider {
    static var previews: some View {
        SimpleList2()
    }
}
