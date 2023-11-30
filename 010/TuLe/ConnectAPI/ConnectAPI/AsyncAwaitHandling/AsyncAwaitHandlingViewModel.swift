//
//  AsyncAwaitHandlingViewModel.swift
//  ConnectAPI
//
//  Created by Tu Le C. [2] VN.Danang on 05/07/2023.
//

import Foundation

protocol GetAsyncAwait {
    func GetCocktails(with urlString: String) async throws -> CocktailGlass
}

class AsyncAwaitHandlingViewModel: ObservableObject {
    @Published var data: CocktailGlass = CocktailGlass(cocktail: [])
    
    private var dogService: GetAsyncAwait
    
    init(getApi: GetAsyncAwait = APIAsyncAwaitManager()) {
        self.dogService = getApi
    }
    
    @MainActor func callApi(urlString: String) async {
        do {
            data = try await dogService.GetCocktails(with: urlString)
        } catch {
            print(error)
        }
    }
}

class APIAsyncAwaitManager: GetAsyncAwait {
    func GetCocktails(with urlString: String) async throws -> CocktailGlass {
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "", code: 0, userInfo: nil)
        }
        do {
            let session: URLSession = URLSession.shared
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(CocktailGlass.self, from: data)
            return decodedData
        } catch {
            throw error
        }
    }
}

