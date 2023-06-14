//
//  GroupApiViewModel.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 09/06/2023.
//

import Foundation
import SwiftUI

class GroupApiViewModel: ObservableObject {

    @Published var drinks: [Drink] = []
    @Published var dogs: [Animal] = []
    @Published var cats: [Animal] = []
    @Published var isShowError: Bool = false
    @Published var isLoading: Bool = false

    @MainActor
    func getData() async {
        var tempDrinks: [Drink]?
        var tempDogs: [Animal]?
        var tempCats: [Animal]?
        let dispatchGroup = DispatchGroup()

        isLoading = true

        // API 1
        dispatchGroup.enter()
        ApiManager.fetchDrinks { result in
            switch result {
            case .success(let drinks):
                tempDrinks = drinks
            case .failure(_):
                break
            }
            dispatchGroup.leave()
        }

        // API 2
        dispatchGroup.enter()
        getDogs { [weak self] (animals, error) in
            guard let this = self, let animals = animals else {
                dispatchGroup.leave()
                return
            }
            this.getDetailAnimal(typeAnimal: .dog, animals: animals) { animals in
                tempDogs = animals
                dispatchGroup.leave()
            }
        }

        // API 3
        dispatchGroup.enter()
        getCats { [weak self] (animals, error) in
            guard let this = self, let animals = animals else {
                dispatchGroup.leave()
                return
            }
            this.getDetailAnimal(typeAnimal: .cat, animals: animals) { animals in
                tempCats = animals
                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) {
            self.isLoading = false
            guard let drinks = tempDrinks, let dogs = tempDogs, let cats = tempCats else {
                self.isShowError = true
                return
            }
            self.drinks = drinks
            self.cats = cats
            self.dogs = dogs
        }
    }

    func getDogs(completion: @escaping ([Animal]?, Error?) -> Void) {
        ApiManager.getDogs { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .failure(let error):
                completion(nil, error)
            case .success(let animals):
                let temp = Array(animals.prefix(20))
                completion(temp, nil)
            }
        }
    }

    func getCats(completion: @escaping ([Animal]?, Error?) -> Void) {
        ApiManager.getCats { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .failure(let error):
                completion(nil, error)
            case .success(let animals):
                let temp = Array(animals.prefix(20))
                completion(temp, nil)
            }
        }
    }

    func getDetailAnimal(typeAnimal: TypeAnimal, animals: [Animal], completion: @escaping ([Animal]) -> Void) {
        var tempAnimals = animals
        for (index, animal) in animals.enumerated() {
            ApiManager.getDetailAnimal(typeAnimal: typeAnimal, imageId: animal.imageId ?? "") { [weak self] result in
                guard self != nil else { return }
                switch result {
                case .failure(_):
                    tempAnimals[index].imageId = ""
                case .success(let detail):
                    tempAnimals[index].detail = detail
                    print(index)
                }
                if index == animals.count - 1 {
                    completion(tempAnimals.filter { !($0.imageId?.isEmpty ?? true) })
                }
            }
        }
    }
}
