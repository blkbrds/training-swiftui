//
//  HomeViewModel.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 23/08/2023.
//

import SwiftUI

final class HomeViewModel: ObservableObject {

    @Published var account: Account?
    @State var shouldShowLoading = false
    @Published var shouldShowLogoutAlert = false
    private let localStorage: LocalStorage = .init()

    @MainActor func getSavedAccount() async {
        guard let account = localStorage.getAccount() else { return }
        self.account = account
    }

    @MainActor func logout() {
        localStorage.resetAccount()
    }
}
