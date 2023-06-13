//
//  GestureView.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 08/06/2023.
//

import SwiftUI

enum KindTap: CaseIterable {
    case red
    case purple
    case yellow
    case gray
    
    var color: Color {
        switch self {
        case .red:
            return .red
        case .purple:
            return .purple
        case .yellow:
            return .yellow
        case .gray:
            return .gray
        }
    }
}

struct GestureView: View {
    
    @State private var tap: KindTap = .red
    let space: CGFloat = 15

    var body: some View {
        GeometryReader { geo in
            let height = (geo.size.height - space * 5) / 5
            HStack {
                Spacer()
                VStack(alignment: .center, spacing: space) {
                    ForEach(KindTap.allCases, id: \.self) { square in
                        SquareView()
                            .foregroundColor(square.color)
                            .frame(height: tap == square ? height * 2 : height)
                            .animation(.spring(), value: tap)
                            .onTapGesture {
                                tap = square
                            }
                    }
                }
                .padding([.top, .bottom], space)
                Spacer()
            }
        }
    }
}

struct GestureView_Previews: PreviewProvider {
    static var previews: some View {
        GestureView()
    }
}
