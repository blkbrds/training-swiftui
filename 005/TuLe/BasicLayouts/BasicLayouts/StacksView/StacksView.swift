//
//  StacksView.swift
//  BasicLayouts
//
//  Created by Tu Le C. [2] VN.Danang on 16/03/2023.
//

import SwiftUI

struct StacksView: View {
    var body: some View {
        GeometryReader { gr in
            VStack (spacing: 5) {
                HStack (spacing: 5) {
                    Rectangle()
                        .foregroundColor(.green)
                    Rectangle()
                        .foregroundColor(.blue)
                }
                .frame(height: gr.size.height * 0.18)
                HStack (spacing: 5) {
                    Rectangle()
                    Rectangle()
                    Rectangle()
                }
                .foregroundColor(.red)
                .frame(height: gr.size.height * 0.07)
                HStack (spacing: 5) {
                    Rectangle()
                        .foregroundColor(.orange)
                    VStack (spacing: 5) {
                        Rectangle()
                        Rectangle()
                        Rectangle()
                        Rectangle()
                        Rectangle()
                        Rectangle()
                        Rectangle()
                    }
                    .foregroundColor(.yellow)
                }
            }
        }
        .padding(.all, 10)
    }
}

struct StacksView_Previews: PreviewProvider {
    static var previews: some View {
        StacksView()
    }
}
