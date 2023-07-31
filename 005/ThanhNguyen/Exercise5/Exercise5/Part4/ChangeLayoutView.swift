//
//  ChangeLayoutView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 31/07/2023.
//

import SwiftUI

struct ChangeLayoutView: View {

    @State var selectType: Color = .green

    var body: some View {
        GeometryReader { geo in
            let width: CGFloat = (geo.size.height - 15 * 5) / 5
            VStack(spacing: 15) {
                CustomSquareView(selectType: $selectType, colorType: .green, width: width)
                    .onTapGesture {
                        withAnimation {
                            selectType = .green
                        }
                    }
                CustomSquareView(selectType: $selectType, colorType: .purple, width: width)
                    .onTapGesture {
                        withAnimation {
                            selectType = .purple
                        }
                    }
                CustomSquareView(selectType: $selectType, colorType: .yellow, width: width)
                    .onTapGesture {
                        withAnimation {
                            selectType = .yellow
                        }
                    }
                CustomSquareView(selectType: $selectType, colorType: .brown, width: width)
                    .onTapGesture {
                        withAnimation {
                            selectType = .brown
                        }
                    }
            }
            .padding([.top, .bottom], 15)
            .position(x: geo.size.width / 2, y: geo.size.height / 2)
        }
        .ignoresSafeArea()
    }
}

struct ChangeLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLayoutView()
    }
}
