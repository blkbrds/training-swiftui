//
//  LeftBarItem.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/03/2023.
//

import SwiftUI

struct LeftBarItem: View {

    var body: some View {
        HStack {
            Text(":")
                .foregroundColor(Color(red: 1.0, green: 0.562, blue: 0.561))
                .font(.system(size: 28, weight: .heavy))
            Text(":")
                .foregroundColor(Color(red: 1.0, green: 0.562, blue: 0.561))
                .font(.system(size: 28, weight: .heavy))
            Text("Home")
                .foregroundColor(Color(red: 1.0, green: 0.562, blue: 0.561))
                .font(.system(size: 26))
        }
            .padding([.top, .bottom], 7)
            .padding([.leading, .trailing], 15)
            .background(Color(red: 0.994, green: 0.935, blue: 0.932))
            .cornerRadius(25)
    }

}
