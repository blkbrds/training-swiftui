//
//  ChangeSizeView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/03/2023.
//

import SwiftUI

struct ChangeSizeView: View {

    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 20) {
                Rectangle()
                    .foregroundColor(.green)
                Rectangle()
                    .foregroundColor(.orange)
            }
            Rectangle()
                .foregroundColor(.blue)
        }
        .padding(.all, 20)
    }
}

struct ChangeSizeView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeSizeView()
    }
}

