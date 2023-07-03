//
//  CocktailGlassViewModel.swift
//  ConnectAPI
//
//  Created by Tu Le C. [2] VN.Danang on 29/06/2023.
//

import Foundation

class CocktailGlassViewModel: ObservableObject {
    @Published var data: CocktailGlass = CocktailGlass(cocktail: [])
    
    private var dogService: GetCocktailGlass
    
    init(getApi: GetCocktailGlass = APIManager()) {
        self.dogService = getApi
    }
    
    func callApi(urlString: String) {
        dogService.GetCocktails(with: urlString) { [unowned self] result in
            switch result {
            case .success(let value):
                data = value
            case .failure(let error):
                print(error)
            }
        }
    }
}

