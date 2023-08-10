//
//  AsyncAwaitHandlingViewModel.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 02/06/2023.
//

import Foundation

class AsyncAwaitHandlingViewModel: ObservableObject {

    @Published var drinks: [Drink] = []
    @Published var errorString: String = ""
    @Published var isShowError: Bool = false

    @MainActor
    func getDrinksWithAsync() async {
        do {
            let drinks = try await ApiManager.getDrinksWithAsync()
            self.drinks = drinks
        } catch {
            isShowError = true
            errorString = error.localizedDescription
        }
    }
}
