//
//  HomeViewModel.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 23/08/2023.
//

import SwiftUI

final class HomeViewModel: ObservableObject {

    enum HomeState {
        case initial
        case loading
        case success
        case failure
    }

    @Published var account: Account?
    @Published var shouldShowLogoutAlert = false
    @Published var state: HomeState = .initial

    private let localStorage: LocalStorage = .init()

    @MainActor func getSavedAccount() async {
        state = .loading
        guard let account = localStorage.getAccount() else {
            state = .failure
            return
        }
        self.account = account
        state = .success
    }

    @MainActor func logout() {
        localStorage.resetAccount()
    }
}
