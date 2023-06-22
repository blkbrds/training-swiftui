//
//  ImageUnderTextView.swift
//  ViewModifiers
//
//  Created by Khoa Vo T.A. VN.Danang on 22/06/2023.
//

import SwiftUI

struct ImageUnderTextView: View {

    var body: some View {
        ZStack {
            Image("img-tam")
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 350)
                .cornerRadius(350 / 2)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 350 / 2)
                        .stroke(.white, lineWidth: 4)
                )
                .shadow(radius: 10)
                .opacity(0.8)
            Text("Anh Tâm mải đĩnh")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .edgesIgnoringSafeArea(.all)
    }
}
