//
//  MainView.swift
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

struct MainView: View {
    
    @StateObject var tabbarRouter = TabBarRouter()
    @State var isShowPlusView: Bool = false
    @State var isClearBackground: Bool = false
    @State private var isRotating = 0.0
    @State var isLoadingApi: Bool = true
    @State var loadingOffset: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Spacer()
                contentView
                    .onChange(of: tabbarRouter.currentPage) { newValue in
                        if newValue == .profile {
                            isClearBackground = true
                        } else {
                            isClearBackground = false
                        }
                    }
                    .blur(radius: isLoadingApi ? 3.0 : 0.0)
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [
                                Color(red: 83 / 255, green: 57 / 255, blue: 146 / 255),
                                Color(red: 191 / 255, green: 80 / 255, blue: 196 / 255)
                            ]), startPoint: .leading, endPoint: .trailing)
                        )
                        .foregroundColor(.clear)
                        .clipShape(TabbarShape())
                    
                    HStack {
                        MenuTabItem(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "house", tabName: "Home", tabbarRouter: tabbarRouter, assignedPage: .home)
                            .padding(.leading, 3)
                        MenuTabItem(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "location", tabName: "Location", tabbarRouter: tabbarRouter, assignedPage: .map)
                        PlusTabbarButtonView(width: geometry.size.width/7, height: geometry.size.width/7, systemIconName: "ticket", tabName: "plush", action: showPlusView)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(
                                        LinearGradient(gradient: Gradient(colors: [
                                            Color(red: 9 / 255, green: 251 / 255, blue: 211 / 255, opacity: 1),
                                            Color(red: 9 / 255, green: 251 / 255, blue: 211 / 255, opacity: 0)
                                        ]), startPoint: .leading, endPoint: .trailing),lineWidth: 2)
                                    .frame(width: geometry.size.width / 7 + 15, height: geometry.size.width / 7 + 15)
                            )
                            .rotationEffect(.degrees(45))
                            .rotationEffect(.degrees(isRotating))
                            .offset(y: loadingOffset)
                            .onAppear {
                                loadingOffset = -geometry.size.height/2
                            }
                            .onChange(of: isLoadingApi) { newValue in
                                withAnimation {
                                    if !newValue {
                                        loadingOffset = -geometry.size.height/7/2
                                        isRotating = 0
                                    }
                                }
                            }
                        MenuTabItem(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "category", tabName: "Category", tabbarRouter: tabbarRouter, assignedPage: .videos)
                        MenuTabItem(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "profile", tabName: "Profile", tabbarRouter: tabbarRouter, assignedPage: .profile)
                            .padding(.trailing, 5)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(.clear)
                    .sheet(isPresented: $isShowPlusView) {
                        TicketView()
                    }
                    
                }
            }
            .background(
                isClearBackground ? LinearGradient(gradient: Gradient(colors: [
                    Color(red: 1, green: 1, blue: 1),
                    Color(red: 1, green: 1, blue: 1)
                ]), startPoint: .top, endPoint: .bottom) : LinearGradient(gradient: Gradient(colors: [
                    Color(red: 42 / 255, green: 17 / 255, blue: 103 / 255),
                    Color(red: 23 / 255, green: 12 / 255, blue: 21 / 255)
                ]), startPoint: .top, endPoint: .bottom)
            )
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                if isLoadingApi {
                    withAnimation(.linear(duration: 1)
                        .speed(0.7).repeatForever(autoreverses: false)) {
                            isRotating = 360.0
                        }
                } else {
                    withAnimation(.linear(duration: 1)) {
                        isRotating = 360.0
                    }
                }
            }
        }
    }
    
    @ViewBuilder var contentView: some View {
        switch tabbarRouter.currentPage {
        case .home:
            HomeView(isLoading: $isLoadingApi)
                .environmentObject(tabbarRouter)
        case .map:
            MapView()
                .environmentObject(tabbarRouter)
        case .videos:
            VideosView()
                .environmentObject(tabbarRouter)
        case .profile:
            AccountView()
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
        MainView()
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
            path.addQuadCurve(to: CGPoint(x: rect.width / 2 + 15, y: 35), control: CGPoint(x: rect.width / 2, y: 45))
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
