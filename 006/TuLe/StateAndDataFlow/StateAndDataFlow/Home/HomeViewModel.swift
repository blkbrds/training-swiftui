//
//  HomeViewModel.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 19/04/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var user: User?
    
    func loadData(data: Data?) {
        user = data?.loadData()
    }
}
