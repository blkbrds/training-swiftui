//
//  CaculatorView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 16/02/2023.
//

import SwiftUI

struct CaculatorView: View {

    let screenWidth = UIScreen.main.bounds.width - 74
    let inputArray: [[String]] = [
        ["AC", "+/-", "%", "÷"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ",", "="],
    ]

    var body: some View {
        VStack {
            Spacer()
            Text("0")
                .padding(.horizontal, 32)
                .padding(.bottom, 10)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 90))
                .fontWeight(.light)
            
            ForEach(inputArray, id: \.self) { item in
                HStack(spacing: 14) {
                    ForEach(item, id: \.self) { i in
                        InputCaculatorView(size: screenWidth, inputName: i)
                    }
                }
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .background(.black)
    }
}

struct CaculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CaculatorView()
    }
}
