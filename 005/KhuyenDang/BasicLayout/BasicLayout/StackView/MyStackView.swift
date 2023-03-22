//
//  MyStackView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 21/03/2023.
//

import SwiftUI

struct MyStackView: View {

    var body: some View {

        VStack {
            HStack {
                MyGreenView()
                MyBlueView()
            }
                .frame(height: 150)

            HStack {
                MyRedView()
                MyRedView()
                MyRedView()
            }
                .frame(height: 60)

            HStack {
                MyOrangeView()
                VStack {
                    MyPurpleView()
                    MyPurpleView()
                    MyPurpleView()
                    MyPurpleView()
                    MyPurpleView()
                    MyPurpleView()
                    MyPurpleView()
                }
            }
        }
            .padding()
    }
}
struct MyStackView_Previews: PreviewProvider {
    static var previews: some View {
        MyStackView().previewDevice("iPhone 13 Pro Max")
    }
}
