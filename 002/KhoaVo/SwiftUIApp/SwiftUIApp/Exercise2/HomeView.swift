//
//  HomeView.swift
//  SwiftUIApp
//
//  Created by Khoa Vo T.A. VN.Danang on 15/06/2023.
//

import SwiftUI

struct HomeView: View {

    @Binding var value: String

    var body: some View {
        VStack {
            Text("Home View")
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
