//
//  HomeViewModel.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/04/2023.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var account: Account?
    private var localStorage = LocalStorage()

    func loadData() {
        account = Account(fullname: localStorage.fullname, age: localStorage.age, address: localStorage.address)
    }

    func logout() {
        localStorage.resetUser()
    }

    func viewModelForEdit() -> EditViewModel {

        return EditViewModel(previousFullname: account?.fullname ?? "", previousAddress: account?.address ?? "", previousAge: account?.age ?? 0)
    }
}
