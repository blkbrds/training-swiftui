//
//  MyProfileView.swift
//  BasicLayout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/03/2023.
//

import SwiftUI

enum TypeOfButton {
    case message
    case follow
}

enum TypeInformation {
    case followers
    case following
    case posts
}

struct MyAvatar: View {

    @State var name: String

    var body: some View {
        Image(name)
            .resizable()
            .mask(Circle())
            .shadow(color: Color.gray, radius: 5, x: 2, y: 2)
    }
}

struct MyName: View {

    @State var name: String

    var body: some View {
        Text(name)
            .font(.system(size: 30, weight: .bold))
    }
}

struct MySubName: View {

    @State var name: String

    var body: some View {
        Text(name)
            .font(.system(size: 15))
    }
}

struct MyButtonView: View {

    var type: TypeOfButton = .message

    var body: some View {

        Button(action: { }
            , label: {
                Text(type == .message ? "MESSAGE" : "FOLLOW")
                    .foregroundColor(type == .message ? .black : .white)
                    .fontWeight(.medium)
            })
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 20)
            .background(type == .message ? .white : .black)
            .cornerRadius(30)
            .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(type == .message ? .black : .clear, lineWidth: 1)
        )
    }
}

struct MyInfoView: View {

    @State var name: String
    @State var value: String

    var body: some View {

        VStack(spacing: 5) {
            Text(name)
                .foregroundColor(Color(red: 0.749, green: 0.749, blue: 0.749))
            Text(value)
                .fontWeight(.medium)
        }
    }
}

struct PolygonBackground: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}
