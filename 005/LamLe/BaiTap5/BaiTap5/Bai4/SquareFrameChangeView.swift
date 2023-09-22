//
//  SquareFrameChangeView.swift
//  BaiTap5
//
//  Created by Lam Le T. [2] VN.Danang on 8/23/23.
//

import SwiftUI

struct SquareFrameChangeView: View {
    
    @State var colorType: Color = .green
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                SmallLargeSquareView(selectColor: $colorType, backgroundColor: .green, widthAndHeight: geometry.size.width / 2 - 10)
                SmallLargeSquareView(selectColor: $colorType, backgroundColor: .purple, widthAndHeight: geometry.size.width / 2 - 10)
                SmallLargeSquareView(selectColor: $colorType, backgroundColor: .gray, widthAndHeight: geometry.size.width / 2 - 10)
                SmallLargeSquareView(selectColor: $colorType, backgroundColor: .orange, widthAndHeight: geometry.size.width / 2 - 10)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

struct SquareFrameChangeView_Previews: PreviewProvider {
    static var previews: some View {
        SquareFrameChangeView()
    }
}


struct SmallLargeSquareView: View {
    @Binding var selectColor: Color
    var backgroundColor: Color
    var widthAndHeight: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(backgroundColor)
            .frame(width: selectColor == backgroundColor ? widthAndHeight : widthAndHeight / 2, height: selectColor == backgroundColor ? widthAndHeight : widthAndHeight / 2)
            .onTapGesture {
                withAnimation {
                    selectColor = backgroundColor
                }
            }
    }
}
