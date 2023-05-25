//
//  AccountViewModel.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 25/05/2023.
//

import Foundation

class AccountViewModel: ObservableObject {

    @Published var user: UserContainer = UserContainer(user: User(email: "", userName: "", password: ""))
    
    @MainActor
    func loadData(data: Data?) async {
        do {
            guard let data = try await data?.loadUserData() else {
                return
            }
            user = data
        } catch {
            print(error)
        }
    }
}
