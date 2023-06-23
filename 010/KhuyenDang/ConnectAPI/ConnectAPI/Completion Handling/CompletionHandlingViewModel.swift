//
//  CompletionHandlingViewModel.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 01/06/2023.
//

import Foundation

class CompletionHandlingViewModel: ObservableObject {

    @Published var drinks: [Drink] = []
    @Published var errorString: String = ""
    @Published var isShowError: Bool = false

    func getDrink() {
        ApiManager.getDrinks { [weak self] result in
            guard let this = self else { return }
            DispatchQueue.main.async {
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
