//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 10/04/2023.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(String)
}

class DataManager: ObservableObject {
    private var loginAccounts: [User] = [
        User(email: "lecongtu123@gmail.com", password: "123456"),
        User(email: "lecongtu456@gmail.com", password: "123456"),
        User(email: "lecongtu789@gmail.com", password: "123456")
    ]
    
    func loadData(value: User, completion: @escaping (Result<User>) -> Void) async {
        do {
            try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
            let result = await checkUser(value: value)
            DispatchQueue.main.async {
                if result {
                    completion(.success(value))
                } else {
                    completion(.failure("Tài khoản hoặc mật khẩu không đúng"))
                }
            }
        } catch {
            DispatchQueue.main.async {
                completion(.failure(error.localizedDescription))
            }
            
        }
    }
    
    func checkUser(value: User) async -> Bool {
        for account in loginAccounts {
            if value == account {
                return true
            }
        }
        return false
    }
}
