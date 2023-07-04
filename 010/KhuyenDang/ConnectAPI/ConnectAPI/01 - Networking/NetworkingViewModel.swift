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

    init(drinkService: FakeServer = GetApiCocktailManager()) {
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

protocol FakeServer {
    func fetchDrinks(completion: @escaping ([String]?, String?) -> Void)
}

class GetApiCocktailManager: FakeServer {
    func fetchDrinks(completion: @escaping ([String]?, String?) -> Void) {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita") else {
            completion(nil, "Error: URL invalid")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Error: invalid HTTP response code")
                return
            }
            guard let data = data else {
                completion(nil, "Error: response invalid")
                return
            }
            do {
                let result = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                let drinks = result?["drinks"] as? [[String: Any]] ?? []
                let names = drinks.compactMap { $0["strDrink"] as? String }
                completion(names, nil)
                return
            } catch {
                completion(nil, "JSON decoding error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
