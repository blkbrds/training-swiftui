//
//  TabbarView.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 17/05/2023.
//

import SwiftUI

enum Page {
    case home
    case map
    case videos
    case profile
    case plus
}

struct TabbarView: View {

    @StateObject var tabbarRouter = TabBarRouter()
    @State var isShowPlusView: Bool = false

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                contentView
                Spacer()
                ZStack {
                    HStack {
                        MenuTabItem(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home", tabbarRouter: tabbarRouter, assignedPage: .home)
                            .padding(.leading, 3)
                        MenuTabItem(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "map.fill", tabName: "Map", tabbarRouter: tabbarRouter, assignedPage: .map)
                        Spacer()
                        MenuTabItem(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "video.circle.fill", tabName: "Videos", tabbarRouter: tabbarRouter, assignedPage: .videos)
                        MenuTabItem(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Profile", tabbarRouter: tabbarRouter, assignedPage: .profile)
                            .padding(.trailing, 5)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color(red: 244 / 255, green: 242 / 255, blue: 245 / 255).shadow(radius: 2))
                    .clipShape(TabbarShape())
                    .sheet(isPresented: $isShowPlusView) {
                        NewPostView()
                    }
                    
                    PlusTabbarButtonView(width: geometry.size.width/7, height: geometry.size.width/7, systemIconName: "multiply.square.fill", tabName: "plush", action: showPlusView)
                        .rotationEffect(.degrees(45))
                        .offset(y: -geometry.size.height/7/2)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    @ViewBuilder var contentView: some View {
        switch tabbarRouter.currentPage {
        case .home:
            HomeView()
                .environmentObject(tabbarRouter)
        case .map:
            MapView()
                .environmentObject(tabbarRouter)
        case .videos:
            VideosView()
                .environmentObject(tabbarRouter)
        case .profile:
            ProfileView()
                .environmentObject(tabbarRouter)
        case .plus:
            EmptyView()
        }
    }
    
    func showPlusView() {
        isShowPlusView = true
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}

struct NewPostView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Add a new post")
                .font(.largeTitle)
            Divider()
            Button {
                dismiss()
            } label: {
                Text("Dismiss")
            }
        }
    }
}

struct TabbarShape: Shape {
    func path(in rect: CGRect) -> Path {
        let leftX = (rect.width / 2) - (rect.width / 9) - 10
        let rightX = (rect.width / 2) + (rect.width / 9) + 10
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: leftX - 10, y: 0))
            path.addQuadCurve(to: CGPoint(x: leftX + 10, y: 10), control: CGPoint(x: leftX + 5, y: 3))
            path.addLine(to: CGPoint(x: rect.width / 2 - 15, y: 35))
            path.addQuadCurve(to: CGPoint(x: rect.width / 2 + 15, y: 35), control: CGPoint(x: rect.width / 2, y: 40))
            path.addLine(to: CGPoint(x: rightX - 10, y: 10))
            
            path.addQuadCurve(to: CGPoint(x: rightX + 10, y: 0), control: CGPoint(x: rightX - 5, y: 3))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
}

class TabBarRouter: ObservableObject {
    @Published var currentPage: Page = .home
}
