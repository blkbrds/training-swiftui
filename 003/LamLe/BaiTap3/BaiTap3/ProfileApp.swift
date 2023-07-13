//
//  ProfileApp.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/5/23.
//

import SwiftUI

struct ProfileApp: View {
    
    var body: some View {
        VStack {
            HStack {
                ExtractedView(indexView: 1)
                ExtractedView(indexView: 2)
                ExtractedView(indexView: 3)
            }
            HStack {
                ExtractedView(height: 110.0, width: 110.0, indexView: 4)
                ExtractedView(height: 110.0, width: 110.0, indexView: 5)
                ExtractedView(height: 110.0, width: 110.0, indexView: 6)
            }
            HStack {
                ExtractedView(height: 120.0, width: 120.0, indexView: 7)
                ExtractedView(height: 120.0, width: 120.0, indexView: 8)
                ExtractedView(height: 120.0, width: 120.0, indexView: 9)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct ProfileApp_Previews: PreviewProvider {
    static var previews: some View {
        ProfileApp()
    }
}

struct ExtractedView: View {
    
    var height: CGFloat = 100.0
    var width: CGFloat = 100.0
    var indexView: Int
    
    var body: some View {
        VStack {
            Image("jessieLee")
                .resizable(capInsets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .clipShape(Circle())
                .foregroundColor(.gray)
                .padding(0)
                .frame(width: width, height: height)
                .onTapGesture {
                    print("Index View : \(indexView)" )
                }
            Text("Jessie Lee")
                .foregroundColor(.pink)
                .font(.body)
                .fontWeight(.bold)
        }
        .position(x: 60, y: 70)
    }
}
