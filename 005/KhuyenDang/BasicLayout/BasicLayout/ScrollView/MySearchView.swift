//
//  MySearchView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 21/03/2023.
//

import SwiftUI

struct MySearchView: View {

    @State private var data: String = ""

    var body: some View {
        TextField("Search for the name of the photo", text: $data)
            .padding(.all, 15.0)
            .padding(.leading, 30)
            .font(.system(size: 15))
            .background(Color(red: 0.976, green: 0.976, blue: 0.976))
            .cornerRadius(10)
            .overlay(
            HStack {
                Image("search")
                    .padding(.leading, 15)
                    .foregroundColor(.gray)
                Spacer()
            }
        )
    }
}
