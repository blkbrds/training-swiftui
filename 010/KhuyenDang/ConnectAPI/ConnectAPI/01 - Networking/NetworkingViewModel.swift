//
//  NetworkingViewModel.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/07/2023.
//

import Foundation

class NetworkingViewModel: ObservableObject {

    @Published var drinks: [String] = []
    @Published var errorString: String = ""
    @Published var isShowError: Bool = false
    private var drinkService: FakeServer

    init(drinkService: FakeServer = ApiManager()) {
        self.drinkService = drinkService
    }

    func fetchDrinks() {
        drinkService.fetchDrinks { datas, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.isShowError = true
                    self.errorString = error
                }
                guard let drinks = datas else { return }
                self.drinks = drinks
            }
        }
    }
}
