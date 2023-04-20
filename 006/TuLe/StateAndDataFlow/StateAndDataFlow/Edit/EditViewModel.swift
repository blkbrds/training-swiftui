//
//  EditViewModel.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 19/04/2023.
//

import Foundation

class EditViewModel: ObservableObject {
    
    @Published var user: User = User(email: "", password: "")
    
    func loadData(data: Data?) {
        guard let dataUser = data?.loadData() else { return }
        user = dataUser
    }
    
    func saveData() -> Data? {
        return user.saveData()
    }
}
