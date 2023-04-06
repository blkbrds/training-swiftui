//
//  ChangeLayout.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/03/2023.
//

import SwiftUI

struct ChangeLayout: View {

    var unitHeight = (UIScreen.main.bounds.height - 30 - 3 * 15) / 5
    @State var typeZoom: TypeSquare = .green
    
    var body: some View {
        VStack(spacing: 15) {
            MySquareView(height: unitHeight, type: .green, typeZoom: typeZoom)
                .onTapGesture {
                    typeZoom = .green
                }
            MySquareView(height: unitHeight, type: .purple, typeZoom: typeZoom)
                .onTapGesture {
                    typeZoom = .purple
                }
            MySquareView(height: unitHeight, type: .yellow, typeZoom: typeZoom)
                .onTapGesture {
                    typeZoom = .yellow
                }
            MySquareView(height: unitHeight, type: .orange, typeZoom: typeZoom)
                .onTapGesture {
                    typeZoom = .orange
                }
        }
            .padding([.top, .bottom], 15)
            .ignoresSafeArea()
    }
}

struct ChangeLayout_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLayout().previewDevice("iPhone 8")
    }
}



