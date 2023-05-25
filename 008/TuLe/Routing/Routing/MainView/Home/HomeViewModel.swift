//
//  HomeViewModel.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 22/05/2023.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var homeData = HomeModel(nowPlaying: [], comingSoon: [], topMovies: [])
    @Published var isLoadingSuccess: Bool = false
    
    @MainActor
    func loadData() async {
        do {
            guard let url = Bundle.main.url(forResource: "dummyJson", withExtension: "json") else {
                return
            }
            try? await Task.sleep(until: .now + .seconds(3), clock: .continuous)
            let data = try Data(contentsOf: url)
            homeData = try await data.loadHomeData()
            isLoadingSuccess = false
        } catch { }
    }
}

extension Data {
    func loadHomeData() async throws -> HomeModel {
        do {
            let userData = try JSONDecoder().decode(HomeModel.self, from: self)
            return userData
        } catch {
            throw error
        }
    }
    
    func loadUserData() async throws -> UserContainer {
        do {
            print("ttttttt")
            let userData = try JSONDecoder().decode(UserContainer.self, from: self)
            return userData
        } catch {
            throw error
        }
    }
}
