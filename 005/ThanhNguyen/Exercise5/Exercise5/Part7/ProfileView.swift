//
//  ProfileView.swift
//  Exercise5
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 07/08/2023.
//

import SwiftUI

struct ProfileView: View {

    let sections: [String] = ["PHOTOS", "VIDEOS", "POSTS", "ABOUT"]
    let imagesName: [[String]] = [
        ["img_luffy1", "img_luffy2", "img_luffy3"],
        ["img_luffy4", "img_ace1", "img_luffy5"],
        ["img_luffy6", "img_garp1", "img_luffy_g5"]
    ]
    @State var currentSection: Int = 0

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    ZStack {
                        Image("img_luffy")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width, height: 300)
                            .blur(radius: 15, opaque: true)
                            .clipShape(TrapezoidShape())
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 30)
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .position(.init(x: 40, y: 80))
                        Text("Profile")
                            .font(.system(size: 40, weight: .heavy))
                            .foregroundColor(.white)
                            .position(.init(x: geo.size.width / 2, y: 80))
                        Image("img_luffy_g5")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .cornerRadius(.infinity)
                            .position(.init(x: geo.size.width / 2, y: 200))
                        Image(systemName: "ellipsis")
                            .resizable()
                            .frame(width: 30, height: 6)
                            .rotationEffect(.degrees(90))
                            .position(.init(x: geo.size.width - 30, y: 200))
                    }
                    Text("Monkey D. Luffy")
                        .font(.system(size: 40, weight: .heavy))
                    Text("Straw Hat")
                        .font(.system(size: 20, weight: .medium))
                    HStack(spacing: 20) {
                        RoundedRectangle(cornerRadius: .infinity)
                            .stroke(style: .init(lineWidth: 2))
                            .frame(width: geo.size.width / 3, height: 45)
                            .overlay {
                                Text("MESSAGE")
                                    .font(.system(size: 15, weight: .semibold))
                            }
                        RoundedRectangle(cornerRadius: .infinity)
                            .frame(width: geo.size.width / 3, height: 45)
                            .overlay {
                                Text("FOLLOW")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                    }
                    .padding(.top)
                    HStack(spacing: 35) {
                        SectionOverView(title: "Followers", subtitle: "123M")
                        SectionOverView(title: "Following", subtitle: "345")
                        SectionOverView(title: "Posts", subtitle: "357")
                    }
                    .padding(.top, 30)
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(.gray.opacity(0.5))
                            .frame(height: 1)
                            .padding([.leading, .trailing])
                        HStack {
                            ForEach(Array(sections.enumerated()), id: \.offset) { index, title in
                                VStack {
                                    Spacer()
                                    Text(title)
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(index == currentSection ? .black : .gray.opacity(0.5))
                                        .padding(.bottom, 6)
                                    Rectangle()
                                        .fill(index == currentSection ? .black : .clear)
                                        .frame(width: geo.size.width / 5, height: 1)
                                }
                                .frame(width: geo.size.width / 5, height: 50)
                                .onTapGesture {
                                    self.currentSection = index
                                }
                            }
                        }
                        .frame(height: 50)
                        Rectangle()
                            .fill(.gray.opacity(0.5))
                            .frame(height: 1)
                            .padding([.leading, .trailing])
                    }
                    .padding(.top)
                    VStack(spacing: 1) {
                        ForEach(Array(imagesName.enumerated()), id: \.offset) { rows in
                            HStack(spacing: 1) {
                                ForEach(Array(rows.element.enumerated()), id: \.offset) { imageName in
                                    Image(imageName.element)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                                        .clipped()
                                }
                            }
                        }
                    }
                    Spacer(minLength: 44)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct TrapezoidShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: .init(x: 0, y: 0))
            path.addLine(to: .init(x: rect.width, y: 0))
            path.addLine(to: .init(x: rect.width, y: 150))
            path.addLine(to: .init(x: 0, y: rect.height - 50))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
