//
//  MenuTabItem.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 17/05/2023.
//

import SwiftUI

struct MenuTabItem: View {
    let width, height: CGFloat
    let systemIconName, tabName: String
    @ObservedObject var tabbarRouter: TabBarRouter
    let assignedPage: Page


    var body: some View {
        VStack {
            Image(systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(.horizontal, -3)
        .foregroundColor(tabbarRouter.currentPage == assignedPage ? Color(red: 35 / 255, green: 157 / 255, blue: 251 / 255) : .gray)
        .onTapGesture {
            tabbarRouter.currentPage = assignedPage
        }
    }
}
