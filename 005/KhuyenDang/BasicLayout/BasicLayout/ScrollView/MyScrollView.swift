//
//  MyScrollView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 21/03/2023.
//

import SwiftUI

struct MyScrollView: View {

    var fruits = ["watermelon", "mango", "carrot", "orange", "lemon", "pomegranate", "apple"]

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                ScrollView(showsIndicators: false) {
                    HStack {
                        Image("menu")
                        Spacer()
                        MyAvatarView()
                    }
                        .padding(.trailing, 50)

                    MyText(value: "Hi, BAOLINUU")
                        .font(.system(size: 32, weight: .bold))

                    HStack(spacing: 10) {
                        MySearchView()
                        Image("microphone")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .cornerRadius(10)
                    }
                        .padding(.trailing, 20)

                    MyText(value: "My query")
                        .font(.system(size: 25, weight: .medium))
                        .padding([.top, .bottom])

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(self.fruits, id: \.self) { fruit in
                                MyItemView(name: fruit)
                            }
                        }
                    }

                    HStack {
                        MyText(value: "Popular")
                            .font(.system(size: 25, weight: .medium))
                            .padding([.top, .bottom])
                        Text("view all")
                            .font(.system(size: 15))
                            .foregroundColor(.pink)
                    }
                        .padding(.trailing, 20)

                    VStack {
                        MyMusicView()
                        MyMusicView()
                        MyMusicView()
                        MyMusicView()
                        MyMusicView()
                        MyMusicView()
                        MyMusicView()
                    }
                        .padding(.trailing, 20)
                }

                    .padding(.leading, 20)
                    .padding(.bottom, 40)
                Spacer()

                MyTabbarView()
                    .frame(height: geometry.size.height / 9)
            }
        }
    }
}



struct MyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MyScrollView().previewDevice("iPhone 11")
    }
}
