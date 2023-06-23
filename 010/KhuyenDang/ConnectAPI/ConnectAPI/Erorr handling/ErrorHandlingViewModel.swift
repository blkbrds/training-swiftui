//
//  ErrorHandlingViewModel.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/06/2023.
//

import Foundation

class ErrorHandlingViewModel: ObservableObject {
    @Published var drinks: [Drink] = []
    @Published var errorString: String = ""
    @Published var isShowError: Bool = false
    @Published var isLoading: Bool = false

    func getDrink() {
        isLoading = true
        ApiManager.fetchDrinks { [weak self] result in
            guard let this = self else { return }
            DispatchQueue.main.async {
                this.isLoading = false
                switch result {
                case .success(let drinks):
                    this.drinks = drinks
                case .failure(let error):
                    this.isShowError = true
                    this.errorString = error.localizedDescription
                }
            }
        }
    }
}
