//
//  SettingView.swift
//  SwiftUIDemo
//
//  Created by Khoa Vo T.A. VN.Danang on 16/06/2023.
//

import SwiftUI

struct SettingView: View {

    @Binding var value: String

    var body: some View {
        VStack {
            Text("Setting View")
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
