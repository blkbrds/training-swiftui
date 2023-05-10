//
//  HomeViewModel.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 19/04/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var user: User?
    
    @MainActor
    func loadData(data: Data?) async {
        do {
            guard let data = try await data?.loadData() else {
                return
            }
            user = data
        } catch {
            print(error)
        }
    }
}
