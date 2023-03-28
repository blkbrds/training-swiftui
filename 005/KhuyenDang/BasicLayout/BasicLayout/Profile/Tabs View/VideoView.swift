//
//  VideoView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 23/03/2023.
//

import SwiftUI

struct VideoView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image("video")
                Text("Share an interesting video you recently shot")
                    .frame(width: geo.size.width * 2 / 3)
                    .multilineTextAlignment(.center)
                    .padding()
                Button(action: { },
                    label: {
                        Text("Upload")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .padding(.all, 8)
                    }
                )
                .background(.pink)
                .cornerRadius(10)
            }
                .frame(width: geo.size.width)
                .padding()
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
