//
//  Adaptive.swift
//  GridLayout
//
//  Created by Tu Le C. [2] VN.Danang on 13/06/2023.
//

import SwiftUI

struct Adaptive: View {

    private var gridConfig = [
        GridItem(.adaptive(minimum: 50))
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridConfig, spacing: 10) {
                    ForEach((0...99), id: \.self) { index in
                        Image("dragonBall\(index % 7 + 1)")
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 200)
                            .cornerRadius(10)
                    }
                }
                .padding(10)
            }
            .navigationTitle("Dragon Ball")
        }
    }
}

struct Adaptive_Previews: PreviewProvider {
    static var previews: some View {
        Adaptive()
    }
}