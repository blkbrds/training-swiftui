//
//  WelcomeViewModel.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 24/08/2023.
//

import Foundation

struct WelcomeData {
    let title: String
    let subtitle: String
    let imageName: String
}

extension WelcomeData {
    static let welcomePages: [WelcomeData] = [
        .init(title: "Explore the world easily", subtitle: "To your desire", imageName: "img_welcome1"),
        .init(title: "Reach the unknown spot", subtitle: "To your destination", imageName: "img_welcome2"),
        .init(title: "Make connects with Travello", subtitle: "To your dream trip", imageName: "img_welcome3")
    ]
}

final class WelcomeViewModel: ObservableObject {

    @Published var currentPage: Int {
        didSet {
            welcomeData = WelcomeData.welcomePages[currentPage]
        }
    }
    @Published var welcomeData: WelcomeData

    init() {
        self.currentPage = Constants.defaultPage
        self.welcomeData = WelcomeData.welcomePages[Constants.defaultPage]
    }

    func handleTapBackPage() {
        if currentPage > Constants.defaultPage {
            currentPage -= 1
        }
    }

    func handleTapNextPage() -> Bool {
        if currentPage < WelcomeData.welcomePages.count - 1 {
            currentPage += 1
            return false
        } else {
            return true
        }
    }
}
