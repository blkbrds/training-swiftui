//
//  BackgroundLoginView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 21/02/2023.
//

import SwiftUI

struct BackgroundLoginView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            ZStack {
                Image("Vector 2")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3755)
                
                HStack {
                    Spacer()
                    Image("4wPHHj1TbIB+DzOvnVECzivRW4y 1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.3)
                }
            }
        }
    }
}
