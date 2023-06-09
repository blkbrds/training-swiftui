//
//  BaiTap4.swift
//  GridLayout
//
//  Created by Tu Le C. [2] VN.Danang on 08/06/2023.
//

import SwiftUI

struct BaiTap4: View {

    // Default
    private var gridConfig = [
        GridItem(.flexible(), spacing: 10)
    ]

    /* Flexible
    private var gridConfig = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(minimum: 100), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    */
    
    /* Fixed
    private var gridConfig = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    */
    
    /* Adaptive
    private var gridConfig = [
        GridItem(.adaptive(minimum: 50))
    ]
    */
    
    /* Mixing
    private var gridConfig = [
        GridItem(.fixed(150)),
        GridItem(.adaptive(minimum: 50))
    ]
    */
    
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

struct BaiTap4_Previews: PreviewProvider {
    static var previews: some View {
        BaiTap4()
    }
}
