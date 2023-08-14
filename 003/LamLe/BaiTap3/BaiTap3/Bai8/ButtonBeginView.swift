//
//  ButtonBeginView.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct ButtonBeginView: View {
    var body: some View {
          VStack {
              CustomButton(textTitleColor: .white, buttonType: .facebook)
              CustomButton(textTitleColor: .black.opacity(0.9), buttonType: .google)
              CustomButton(textTitleColor: .white, buttonType: .twitter)
              CustomButton(textTitleColor: .white, buttonType: .title)
              CustomButton(textTitleColor: .white, buttonType: .count)
          }
      }
}

struct ButtonBeginView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBeginView()
    }
}
