//
//  HomeViewModel.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 22/05/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    enum TypeFileName {
        case nowPlaying
        case comingSoon
        case topMovies
        
        var fileNameString: String {
            switch self {
            case .nowPlaying:
                return "nowplaying"
            case .comingSoon:
                return "comingsoon"
            case .topMovies:
                return "topmovies"
            }
        }
    }

    @Published var nowPlaying: [HomeModel] = []
    @Published var comingSoon: [HomeModel] = []
    @Published var topMovies: [HomeModel] = []
    @Published var isLoadingSuccess: Bool = false
    @Published var popup = (isShow: false, contentErr: "")
    
    @MainActor
    func loadData(typeFileName: TypeFileName) async {
        do {
            let resultt = try await HomeAPIManager().readJsonFile(fileName: typeFileName.fileNameString)
            switch typeFileName {
            case .nowPlaying:
                nowPlaying = resultt.results
            case .comingSoon:
                comingSoon = resultt.results
            case .topMovies:
                topMovies = resultt.results
            }
            isLoadingSuccess = false
        } catch {
            popup.contentErr = error.localizedDescription
            popup.isShow = true
        }
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
            let userData = try JSONDecoder().decode(UserContainer.self, from: self)
            return userData
        } catch {
            throw error
        }
    }
}
