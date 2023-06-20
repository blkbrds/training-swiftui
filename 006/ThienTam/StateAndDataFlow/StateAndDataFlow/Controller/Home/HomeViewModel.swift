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
    
    func isSameTab(tab: TabView) -> Bool {
        return selectedTab == tab
    }
    
    func setSelectedTab(tab: TabView) {
        selectedTab = tab
    }

    func clearUser() {
        DataManager().logoutUser()
    }
}
