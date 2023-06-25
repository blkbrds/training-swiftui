//
//  HomeViewModel.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 20/06/2023.
//

import SwiftUI

enum TabView: Int, CaseIterable {
    case photos
    case videos
    case posts
    case about

    var toString: String {
        switch self {
        case .photos:
            return "PHOTOS"
        case .videos:
            return "VIDEOS"
        case .posts:
            return "POSTS"
        case .about:
            return "ABOUT"
        }
    }
}

final class HomeViewModel: ObservableObject {

    @Published var selectedTab: TabView = .photos
    @AppStorage("isDarkMode") var isDarkMode = false
    @AppStorage("isLoggedIn") var isLoggedIn = false

    func isSameTab(tab: TabView) -> Bool {
        return selectedTab == tab
    }

    func setSelectedTab(tab: TabView) {
        selectedTab = tab
    }

    func clearLocalStorage() async {
        do {
            LocalStore.shared.clearUser()
            DispatchQueue.main.async {
                self.isDarkMode = false
                self.isLoggedIn = false
            }
        } catch {
            print(error)
        }
    }

    func getFullName() -> String {
        return LocalStore.shared.getFullName()
    }
}
