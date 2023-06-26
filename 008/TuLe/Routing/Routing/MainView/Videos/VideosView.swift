//
//  VideosView.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 17/05/2023.
//

import SwiftUI

struct VideosView: View {
    
    @EnvironmentObject var tabbarRouter: TabBarRouter
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hanlde Later")
                .font(.largeTitle)
                .foregroundColor(.white)
            Divider()
            HStack {
                Button {
                    tabbarRouter.currentPage = .home
                } label: { Text("Tab #1")  }.buttonStyle(.borderedProminent)
                Button {
                    tabbarRouter.currentPage = .map
                } label: { Text("Tab #2") }.buttonStyle(.borderedProminent)
                
                Button {
                    tabbarRouter.currentPage = .videos
                } label: { Text("Tab #3") }.buttonStyle(.borderedProminent)
                
                Button {
                    tabbarRouter.currentPage = .profile
                } label: { Text("Tab #4") }.buttonStyle(.borderedProminent)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}