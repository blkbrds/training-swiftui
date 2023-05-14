//
//  InputView.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 14/05/2023.
//

import SwiftUI

struct ThreeSideView: View {
    let imageString: String
    let action: () -> Void

    var body: some View {
        Image(imageString)
            .resizable()
            .frame(width: 48, height: 48, alignment: .center)
            .onTapGesture {
            action()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeSideView(imageString: "facebook", action: {
            
        })
    }
}
