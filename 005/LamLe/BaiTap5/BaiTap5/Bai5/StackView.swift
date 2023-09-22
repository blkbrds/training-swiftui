//
//  StackView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/23/23.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack(spacing: 10.0) {
                    RectangleCustomView(width: geometry.size.width / 2 - 20, height: geometry.size.height / 3 - 50, backgroundColor: .green)
                    RectangleCustomView(width: geometry.size.width / 2 - 20, height: geometry.size.height / 3 - 50, backgroundColor: .blue)
                }
                HStack(spacing: 10.0) {
                    ForEach(0..<3) { index in
                        RectangleCustomView(width: geometry.size.width / 3 - 50/3, height: geometry.size.height / 5 - 50, backgroundColor: .red)
                    }
                }
                HStack(spacing: 10.0) {
                    RectangleCustomView(width: geometry.size.width / 2 - 20, height: geometry.size.height / 2, backgroundColor: .orange)
                    VStack(spacing: 10.0) {
                        ForEach(0..<7) { index in
                            RectangleCustomView(width: geometry.size.width / 2 - 20, height: geometry.size.height / 14 - 60/7, backgroundColor: .purple)
                        }
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}

struct RectangleCustomView: View {
    var width: CGFloat
    var height: CGFloat
    var backgroundColor: Color
    
    var body: some View {
        Rectangle()
            .fill(backgroundColor)
            .frame(width: width, height: height)
    }
}
