//
//  ResizeView.swift
//  BasicLayouts
//
//  Created by Tu Le C. [2] VN.Danang on 15/03/2023.
//

import SwiftUI

struct ResizeView: View {
    var body: some View {
        VStack (spacing: 40) {
            HStack (spacing: 20){
                Rectangle()
                    .foregroundColor(.green)
                Rectangle()
                    .foregroundColor(.orange)
            }
            
            Rectangle()
                .foregroundColor(.blue)
        }
        .padding(30)
    }
}

struct ResizeView_Previews: PreviewProvider {
    static var previews: some View {
        ResizeView()
    }
}
