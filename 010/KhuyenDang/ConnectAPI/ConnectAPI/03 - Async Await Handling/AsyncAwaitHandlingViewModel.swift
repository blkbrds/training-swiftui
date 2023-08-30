//
//  AsyncAwaitHandlingViewModel.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/07/2023.
//

import Foundation

class AsyncAwaitHandlingViewModel: ObservableObject {

    @Published var drinks: [Drink] = []
    @Published var errorString: String?
    @Published var isShowError: Bool = false
    private var drinkService: FakeServer

    init(drinkService: FakeServer = ApiManager()) {
        self.drinkService = drinkService
    }

    @MainActor
    func getDrinksWithAsync() async {
        do {
            let drinks = try await drinkService.getDrinksWithAsync()
            self.drinks = drinks
        } catch {
            isShowError = true
            errorString = error.localizedDescription
        }
    }
}
