//
//  WelcomeViewModel.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 24/08/2023.
//

import Foundation

final class WelcomeViewModel: ObservableObject {

    struct Constants {
        static let defaultPage: Int = 0
    }

    struct WelcomeData {
        let title: String
        let subtitle: String
        let imageName: String
    }

    let welcomePages: [WelcomeData] = [
        .init(title: "Explore the world easily", subtitle: "To your desire", imageName: "img_welcome1"),
        .init(title: "Reach the unknown spot", subtitle: "To your destination", imageName: "img_welcome2"),
        .init(title: "Make connects with Travello", subtitle: "To your dream trip", imageName: "img_welcome3")
    ]

    @Published var currentPage: Int
    @Published var welcomeData: WelcomeData

    init() {
        self.currentPage = Constants.defaultPage
        self.welcomeData = welcomePages[Constants.defaultPage]
    }

    func handleTapBackPage() {
        if currentPage > Constants.defaultPage {
            currentPage -= 1
            welcomeData = welcomePages[currentPage]
        }
    }

    func handleTapNextPage() -> Bool {
        if currentPage < welcomePages.count - 1 {
            currentPage += 1
            welcomeData = welcomePages[currentPage]
            return false
        } else {
            return true
        }
    }
}
