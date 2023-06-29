//
//  StackView.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 08/06/2023.
//

import SwiftUI

struct StackView: View {
    
    let space: CGFloat = 10
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack(spacing: space){
                    ForEach(0 ... 1, id: \.self) { _ in
                        Rectangle()
                            .foregroundColor(Color.green)
                    }
                }
                HStack(spacing: space){
                    ForEach(0 ... 2, id: \.self) { _ in
                        Rectangle()
                            .foregroundColor(Color.blue)
                    }
                }
                HStack{
                    Rectangle()
                        .foregroundColor(Color.orange)
                    VStack(spacing: space) {
                        ForEach(0 ... 6, id: \.self) { _ in
                            Rectangle()
                                .foregroundColor(Color.blue)
                        }
                    }
                }
                .frame(height: geo.size.height * 0.6)
            }
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
