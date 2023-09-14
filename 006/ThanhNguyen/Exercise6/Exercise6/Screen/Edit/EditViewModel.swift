//
//  EditViewModel.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 24/08/2023.
//

import Foundation

final class EditViewModel: ObservableObject {

    var profileAccount: Account?
    @Published var nickname: String
    @Published var address: String
    var shouldShowError = false
    private let localStorage: LocalStorage = .init()

    init(profileAccount: Account?) {
        self.profileAccount = profileAccount
        self.nickname = profileAccount?.nickname ?? ""
        self.address = profileAccount?.address ?? ""
    }

    func updateAccountInfo() {
        if nickname.isEmpty && address.isEmpty {
            shouldShowError = true
        } else {
            let updateAccount = Account(id: profileAccount?.id ?? 0,
                                        email: profileAccount?.email ?? "",
                                        password: profileAccount?.password ?? "",
                                        address: address,
                                        nickname: nickname)
            localStorage.saveAccount(account: updateAccount)
        }
    }
}
