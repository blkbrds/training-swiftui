//
//  StacksView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 31/07/2023.
//

import SwiftUI

struct StacksView: View {

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 10) {
                HStack {
                    Rectangle()
                        .foregroundColor(.green)
                    Rectangle()
                        .foregroundColor(.blue)
                }
                .frame(height: geo.size.height * 0.25)
                HStack(spacing: 10) {
                    ForEach(0..<3, id: \.self) { _ in
                        Rectangle()
                    }
                }
                .frame(height: geo.size.height * 0.1)
                .foregroundColor(.red)
                HStack(spacing: 10) {
                    Rectangle()
                        .foregroundColor(.orange)
                    VStack(spacing: 10) {
                        ForEach(0..<7, id: \.self) { _ in
                            Rectangle()
                        }
                    }
                    .frame(width: 200)
                    .foregroundColor(.blue)
                }
            }
        }
        .padding([.leading, .trailing], 10)
    }
}

struct StacksView_Previews: PreviewProvider {
    static var previews: some View {
        StacksView()
    }
}
