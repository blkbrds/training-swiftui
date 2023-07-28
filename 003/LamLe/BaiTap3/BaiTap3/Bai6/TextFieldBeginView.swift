//
//  TextFieldBeginView.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import SwiftUI

struct TextFieldBeginView: View {
    @State var name: String = ""
    @State var password: String = ""
        var body: some View {
            VStack(alignment: .leading) {
                CustomTextField(title: "Enter Your Name", value: name, isPassword: false)
    //                .border(Color.blue, width: 2)
    //                .textFieldStyle(.roundedBorder)
    //                .padding(30)
    //                .foregroundColor(.blue)
    //                .bold()
    //                .font(.system(size: 14, weight: .heavy, design: .rounded))
    //                .shadow(color: Color.gray.opacity(1.0),
    //                            radius: 3, x: 1, y: 2)
                    
                CustomTextField(title: "Enter Your Password", value: password, isPassword: true)
    //                .border(Color.red, width: 2)
    //                .textFieldStyle(.automatic)
    //                .padding(30)
    //                .font(.title2)
    //                .foregroundColor(.red)
    //                .shadow(color: Color.black.opacity(1.0),
    //                            radius: 5, x: 1, y: 10)
            }
        }
}

struct TextFieldBeginView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBeginView()
    }
}
