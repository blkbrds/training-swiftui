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
                HomeListView(title: "Now Playing", data: viewModel.nowPlaying)
                HomeListView(title: "Comming soon", data: viewModel.comingSoon)
                HomeListView(title: "Top movies", data: viewModel.topMovies)
            }
            .frame(maxWidth: .infinity)
            .background(
                .clear
            )
            .onAppear {
                Task {
                    await fetchData()
                    isLoading = viewModel.isLoadingSuccess
                }
            }
            .preferredColorScheme(.dark)
            .alert(isPresented: $viewModel.popup.isShow) {
                Alert(title: Text("Login fail") ,message: Text("\(viewModel.popup.contentErr)"), dismissButton: .default(Text("Got it!")))
            }
        }
    }
    func fetchData() async {
        await Task.withGroup(resultType: Void.self, body: { group in
            group.addTask {
                await viewModel.loadData(typeFileName: .nowPlaying)
            }
            group.addTask {
                await viewModel.loadData(typeFileName: .topMovies)
            }
            group.addTask {
                await viewModel.loadData(typeFileName: .comingSoon)
            }
        })
    }
}

struct HomeListView: View {
    var title: String
    var data: [HomeModel]
    
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
                    HomeRow(imageName: item.posterPath)
                        .frame(width: 100, height: 130)
                }
            }
        }
    }
}

struct HomeRow: View {
    var imageName: String
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 100, height: 130)
            }
        }
    }
}
