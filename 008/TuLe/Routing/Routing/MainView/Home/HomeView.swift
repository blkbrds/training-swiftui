//
//  HomeView.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 17/05/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var tabbarRouter: TabBarRouter
    @StateObject var viewModel = HomeViewModel()
    @State private var isRotating = 0.0
    @Binding var isLoading: Bool
    
    var body: some View {
        VStack {
            Text("Choose movie")
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            ScrollView {
                
                ScrollView {
                    NowPlayingView(title: "Now Playing" ,data: viewModel.homeData.nowPlaying)
                    NowPlayingView(title: "Coming soon" ,data: viewModel.homeData.comingSoon)
                    NowPlayingView(title: "Top Movíe" ,data: viewModel.homeData.topMovies)
                }
            }
            .frame(maxWidth: .infinity)
            .background(
                .clear
            )
            .onAppear {
                Task {
                    await viewModel.loadData()
                    isLoading = viewModel.isLoadingSuccess
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct NowPlayingView: View {
    
    var title: String
    var data: [String]
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(data, id: \.self) { item in
                    if item == data.first {
                        Image(item)
                            .resizable()
                            .frame(width: 100, height: 130)
                            .padding(.leading)
                    } else if item == data.last {
                        Image(item)
                            .resizable()
                            .frame(width: 100, height: 130)
                            .padding(.trailing)
                    } else {
                        Image(item)
                            .resizable()
                            .frame(width: 100, height: 130)
                    }
                    
                }
            }
        }
    }
}
