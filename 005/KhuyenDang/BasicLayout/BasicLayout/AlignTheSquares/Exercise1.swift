//
//  Exercise1.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/03/2023.
//

import SwiftUI

struct Exercise1: View {

    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200)
            .foregroundColor(.blue)
    }
}

struct Exercise1_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1()
    }
}

