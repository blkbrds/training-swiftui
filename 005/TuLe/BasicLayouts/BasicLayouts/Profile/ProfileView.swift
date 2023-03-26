//
//  ProfileView.swift
//  BasicLayouts
//
//  Created by Tu Le C. [2] VN.Danang on 23/03/2023.
//

import SwiftUI

struct ProfileView: View {

    var tabs = ["PHOTOS", "VIDEOS", "POSTS", "ABOUT"]
    let widthScreen = UIScreen.main.bounds.width
    @State var isSelectedTab: Int = 0

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack {
                    Image("dejong")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .infinity, height: 250)
                        .blur(radius: 15, opaque: true)
                        .clipShape(BackgroundImageHeaderShape())
                    
                    VStack {
                        Text("Profile")
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(.white)
                        
                        ZStack(alignment: .trailing) {
                            HStack {
                                Spacer()
                                Image("dejong")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                .clipShape(Circle())
                                Spacer()
                            }
                            
                            Image(systemName: "ellipsis")
                                .resizable()
                                .frame(width: 20, height: 4)
                                .rotationEffect(.degrees(-90))
                                .padding()
                        }
                        
                    }
                    .padding(.top, UIScreen.main.focusedView?.safeAreaInsets.top)
                }
                
                Text("Frenkie de Jong")
                    .font(.system(size: 30, weight: .bold))
                
                Text("football player")
                    .font(.system(size: 13))
                    .padding(.top, 5)
                
                HStack (spacing: 30) {
                    AssociateView(title: "MESSAGE", titleColor: .black, isStroke: true, isBackground: false)
                    AssociateView(title: "FOLLOW", titleColor: .white, isStroke: false, isBackground: true)
                }
                .padding(.all, 30)
                
                HStack(spacing: 30) {
                    IntroduceView(title: "Followers", value: 252)
                    IntroduceView(title: "Following", value: 378)
                    IntroduceView(title: "Posts", value: 115)
                }

                VStack {
                    LineView(isSelected: false)
                    HStack {
                        ForEach(tabs, id: \.self) { element in
                            Button  {
                                guard let index = tabs.firstIndex(where: { $0 == element }) else { return }
                                isSelectedTab = index
                            } label: {
                                Text(element)
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(Color(red: 203 / 255, green: 203 / 255, blue: 203 / 255))
                            }
                            
                            if element != tabs.last { Spacer() }

                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 7)

                    HStack(spacing: 0) {
                        ForEach(tabs, id: \.self) { element in
                            if tabs[isSelectedTab] == element {
                                LineView(isSelected: true)
                            } else {
                                LineView(isSelected: false)
                            }
                        }
                    }

                    VStack (spacing: 1) {
                        ForEach(1...5, id: \.self) { _ in
                            HStack(spacing: 1) {
                                Image("dejong1")
                                    .resizable()
                                    .frame(width: (widthScreen - 2) / 3, height: (widthScreen - 2) / 3)
                                Image("dejong2")
                                    .resizable()
                                    .frame(width: (widthScreen - 2) / 3, height: (widthScreen - 2) / 3)
                                Image("dejong3")
                                    .resizable()
                                    .frame(width: (widthScreen - 2) / 3, height: (widthScreen - 2) / 3)
                            }
                        }
                    }
                    .padding(.horizontal, -20)
                }
                .padding(.horizontal, 20)
                .padding(.top, 35)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct BackgroundImageHeaderShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 125))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 30))
        }
    }
}

struct AssociateView: View {
    
    var title: String
    var titleColor: Color
    var isStroke: Bool
    var isBackground: Bool

    var body: some View {
        Button {
            print(title)
        } label: {
            ZStack {
                if isStroke {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 1)
                        .frame(width: 110, height: 40)
                }
                if isBackground {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 110, height: 40)
                        .foregroundColor(.black)
                }
                
                Text(title)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(titleColor)
            }
        }
    }
}

struct IntroduceView: View {

    var title: String
    var value: Int

    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .foregroundColor(Color(red: 190 / 255, green: 190 / 255, blue: 190 / 255))
            Text("\(value)")
                .fontWeight(.medium)
        }
    }
}

struct LineView: View {

    var isSelected: Bool

    var body: some View {
        if isSelected {
            Rectangle()
                .frame(height: 2)
                .opacity(1)
        } else {
            Rectangle()
                .frame(height: 1)
                .opacity(0.1)
        }
    }
}
