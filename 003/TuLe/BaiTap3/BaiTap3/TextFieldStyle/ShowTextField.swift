//
//  ShowTextField.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 20/02/2023.
//

import SwiftUI

struct ShowTextField: View {

    @State var userName: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            TextField("nhập Username", text: $userName)
                .font(.system(size: 15))
                .padding(EdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16))
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255), lineWidth: 3)
                        .shadow(radius: 5)
                }
                .multilineTextAlignment(.leading)
                .padding()
            
            SecureField("nhập password", text: $password)
                .font(.system(size: 15))
                .padding(EdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16))
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255), lineWidth: 3)
                        .shadow(radius: 5)
                }
                .multilineTextAlignment(.leading)
                .padding()
        }
    }
}

struct ShowTextField_Previews: PreviewProvider {
    static var previews: some View {
        ShowTextField()
    }
}
