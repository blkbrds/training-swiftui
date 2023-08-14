//
//  TopWelcomeView.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/25/23.
//

import SwiftUI

struct TopWelcomeView: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("main_logo")
                .resizable()
                .frame(width: 65, height: 65)
            Text("ThanhLam \nFoodService")
                .font(.system(size: 37, weight: .bold, design: .monospaced))
                .multilineTextAlignment(.center)
        }
    }
}

struct TopWelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        TopWelcomeView()
    }
}
