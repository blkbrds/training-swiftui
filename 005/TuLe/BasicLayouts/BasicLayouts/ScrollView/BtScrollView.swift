//
//  BtScrollView.swift
//  BasicLayouts
//
//  Created by Tu Le C. [2] VN.Danang on 20/03/2023.
//

import SwiftUI

struct BtScrollView: View {

    @State var searchText: String = ""
    var tab = ["house", "bookmark.circle.fill"]

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                VStack (alignment: .leading) {
                    HeaderView()
                    
                    Text("Hi,BAOLINUU")
                        .font(.system(size: 27, weight: .bold))
                        .padding(.top, -15)
                        .foregroundColor(Color(red: 76 / 255, green: 52 / 255, blue: 38 / 255))

                    HStack(spacing: 15) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(red: 205 / 255, green: 189 / 255, blue: 191 / 255))
                            TextField(text: $searchText) {
                                HStack {
                                    Text("Please input your name")
                                        .font(.system(size: 15))
                                }
                            }
                        }
                        .padding(.all, 10)
                        .background(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
                        .cornerRadius(10)
                        
                        Image(systemName: "mic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .padding(10)
                            .background(Color(red: 255 / 255, green: 121 / 255, blue: 121 / 255))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Text("My, Query")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.vertical)
                        .foregroundColor(Color(red: 104 / 255, green: 45 / 255, blue: 48 / 255))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            CardView(title: "Strawberry", color: Color(red: 255 / 255, green: 208 / 255, blue: 212 / 255), imageName: "monkey")
                            CardView(title: "Mango", color: Color(red: 255 / 255, green: 235 / 255, blue: 186 / 255), imageName: "monkey")
                            
                            CardView(title: "ice cream", color: Color(red: 230 / 255, green: 235 / 255, blue: 197 / 255), imageName: "monkey")
                        }
                    }
                    
                    HStack {
                        Text("PoPular")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(red: 104 / 255, green: 45 / 255, blue: 48 / 255))
                        Spacer()
                        Text("view all")
                            .font(.system(size: 15))
                            .foregroundColor(Color(red: 255 / 255, green: 146 / 255, blue: 162 / 255))
                    }
                    .padding(.vertical)
                    
                    ForEach((1...10).reversed(), id: \.self) { index in
                        if index == 1 {
                            PopularView()
                                .padding(.bottom, 60)
                        } else {
                            PopularView()
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            
            TabView(tabIcon: tab)
        }
    }
}

struct BtScrollView_Previews: PreviewProvider {
    static var previews: some View {
        BtScrollView()
    }
}

struct PopularView: View {
    var body: some View {
        HStack {
            Image("monkey")
                .resizable()
                .frame(width: 70, height:  70)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 10) {
                Text("Henning-olsens slow")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(red: 104 / 255, green: 45 / 255, blue: 48 / 255))
                Text("Chumed iceream")
                    .font(.system(size: 10))
                    .foregroundColor(Color(red: 202 / 255, green: 193 / 255, blue: 191 / 255))
            }
            
            Spacer()
            
            Text("...")
                .font(.title3)
                .foregroundColor(.pink)
        }
        .padding()
        .background(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
        .cornerRadius(20)
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            let center = rect.width / 2
            path.addLine(to: CGPoint(x: rect.width / 3 - 30, y: 0))
            
            path.addCurve(to: CGPoint(x: center, y: 40), control1: CGPoint(x: rect.width / 2 - 10, y: 0), control2: CGPoint(x: center - 50, y: 40))
            path.addCurve(to: CGPoint(x: 2 * rect.width / 3 + 30, y: 0), control1: CGPoint(x: center + 50, y: 40), control2: CGPoint(x: center + 10, y: 0))

            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: UIScreen.main.bounds.height))
            path.addLine(to: CGPoint(x: 0, y: UIScreen.main.bounds.height))
        }
    }
}

struct CustomShape1: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            let center = rect.width / 2
            path.addLine(to: CGPoint(x: rect.width / 3 - 30, y: 0))
            
            path.addCurve(to: CGPoint(x: center, y: 40), control1: CGPoint(x: rect.width / 2 - 10, y: 0), control2: CGPoint(x: center - 50, y: 40))
            path.addCurve(to: CGPoint(x: 2 * rect.width / 3 + 30, y: 0), control1: CGPoint(x: center + 50, y: 40), control2: CGPoint(x: center + 10, y: 0))

            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: -1))
            path.addLine(to: CGPoint(x: 2 * rect.width / 3 + 30, y: -1))
            path.addCurve(to: CGPoint(x: center, y: 39), control1: CGPoint(x: center + 10, y: -1), control2: CGPoint(x: center + 50, y: 39))
            path.addCurve(to: CGPoint(x: rect.width / 3 - 30, y: -1), control1: CGPoint(x: center - 50, y: 39), control2: CGPoint(x: rect.width / 2 - 10, y: -1))
            
            path.addLine(to: CGPoint(x: 0, y: -1))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CardView: View {

    var title: String
    var color: Color
    var imageName: String

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 150, height: 200)
            .overlay {
                VStack(spacing: 5) {
                    Image(imageName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.vertical, 10)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.black)
                        .blur(radius: 5)
                        .frame(width: 100, height: 3)
                    
                    Text(title)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.green)
                    
                }
            }
            .foregroundColor(color)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Button {
                print("")
            } label: {
                VStack(alignment: .leading, spacing: 5) {
                    Rectangle()
                        .frame(width: 25, height: 3)
                    Rectangle()
                        .frame(width: 15, height: 3)
                }
                .foregroundColor(Color(red: 127 / 255, green: 111 / 255, blue: 105 / 255))
            }
            
            Spacer()
            
            Image("no-avatar")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
                .padding(.horizontal ,20)
        }
        .padding(.bottom, 20)
    }
}

struct TabView: View {

    var tabIcon: [String]

    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                ForEach(tabIcon, id: \.self) { image in
                    Button {
                        print("")
                    } label: {
                        Image(systemName: image)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                    }
                    
                    if image != tabIcon.last { Spacer(minLength: 0) }
                    
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 20)
            .background(Color.white.clipShape(CustomShape()))
            .overlay {
                Rectangle()
                    .background(Color(red: 255 / 255, green: 206 / 255, blue: 213 / 255).clipShape(CustomShape1()))
                    .foregroundColor(.clear)
                
            }
            
            Circle()
                .foregroundColor(.pink)
                .frame(width: 60, height: 60)
                .offset(y: -25)
                .overlay {
                    Image(systemName: "camera.metering.none")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .offset(y: -25)
                }
        }
    }
}
