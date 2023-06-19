//
//  DetailView.swift
//  SwiftUIApp
//
//  Created by Khoa Vo T.A. VN.Danang on 16/06/2023.
//

import SwiftUI

struct DetailView: View {

    @Binding var value: String

    var body: some View {
        VStack {
            Text("Detail View")
                .font(.title)
                .foregroundColor(.purple)
                .padding()
            Text("\(value)")
                .font(.caption)
                .foregroundColor(.purple)
                .padding()
        }
        .padding()
    }
}
