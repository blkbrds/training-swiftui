//
//  HomeViewModel.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/04/2023.
//

import Foundation

class HomeViewModel: ObservableObject {

    private var localStorage = LocalStorage()

    func loadData(account: Account) {
        guard localStorage.fullname.isEmpty == false else { return }
        account.updateUser(fullname: localStorage.fullname, age: localStorage.age, address: localStorage.address)
    }

    func logout() {
        localStorage.resetUser()
    }

    func viewModelForEdit(account: Account) -> EditViewModel {
        return EditViewModel(previousFullname: account.fullname ?? "", previousAddress: account.address ?? "", previousAge: account.age ?? 0)
    }
}
