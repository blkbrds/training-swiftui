//
//  LoginViewModel.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 19/04/2023.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isShowAlert: Bool = false
    @Published var titleError: String = ""
    @Published var contentError: String = ""
    
    func handleLogin(completion: @escaping (Result<Data>) -> Void) async {
        Task {
            await DataManager().loadData(value: User(email: email, password: password), completion: { [weak self] result in
                guard let this = self else { return }
                switch result {
                case .success:
                    let user = User(email: this.email, password: this.password)
                    completion(.success(user.saveData() ?? Data()))
                case .failure(let error):
                    this.titleError = "Login failed"
                    this.contentError = error
                    this.isShowAlert = true
                    completion(.failure(error))
                }
            })
        }
    }
}
