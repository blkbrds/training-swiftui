//
//  TextFieldBaiTap6App.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/10/23.
//

import SwiftUI

struct TextFieldBaiTap6App: View {
    
    @State private var name: String = ""
    @State private var passWord: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter Your Name", text: $name, axis: .vertical)
//                .border(Color.blue, width: 2)
//                .textFieldStyle(.roundedBorder)
//                .padding(30)
//                .foregroundColor(.blue)
//                .bold()
//                .font(.system(size: 14, weight: .heavy, design: .rounded))
//                .shadow(color: Color.gray.opacity(1.0),
//                            radius: 3, x: 1, y: 2)
                .cuteTextField()
                
            SecureField("Enter Your PassWord", text: $passWord)
//                .border(Color.red, width: 2)
//                .textFieldStyle(.automatic)
//                .padding(30)
//                .font(.title2)
//                .foregroundColor(.red)
//                .shadow(color: Color.black.opacity(1.0),
//                            radius: 5, x: 1, y: 10)
                .cuteTextField()
        }
    }
}

struct TextFieldBaiTap6App_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBaiTap6App()
    }
}
