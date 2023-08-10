//
//  ConnectUrlsApiViewModel.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 07/06/2023.
//

import Foundation

class ConnectUrlsApiViewModel: ObservableObject {

    @Published var animals: [Animal] = []
    @Published var isLoading: Bool = false
    @Published var isShowError: Bool = false
    @Published var errorString: String = ""
    var realAnimals: [Animal] {
        return animals.filter { !($0.imageId?.isEmpty ?? true) }
    }

    func fetchAnimals() {
        isLoading = true
        getAnimals { (animals, error) in
            guard let animals = animals else {
                self.errorString = error?.localizedDescription ?? ""
                self.isShowError = true
                self.isLoading = false
                return
            }
            self.animals = animals
            self.getDetailAnimal(animals: animals)
            self.isLoading = false
        }
    }

    func getDetailAnimal(animals: [Animal]) {
        for (index, animal) in animals.enumerated() {
            ApiManager.getDetailAnimal(typeAnimal: .dog, imageId: animal.imageId ?? "") { [weak self] result in
                guard let this = self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case .failure(_):
                        this.animals[index].imageId = ""
                    case .success(let detail):
                        this.animals[index].detail = detail
                    }
                }
            }
        }
    }

    func getAnimals(completion: @escaping ([Animal]?, Error?) -> Void) {
        ApiManager.getDogs { [weak self] result in
            guard self != nil else { return }
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    completion(nil, error)
                case .success(let animals):
                    let temp = Array(animals.prefix(20))
                    completion(temp, nil)
                }
            }
        }
    }
}
