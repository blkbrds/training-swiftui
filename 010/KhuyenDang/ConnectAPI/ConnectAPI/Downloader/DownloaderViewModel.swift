//
//  DownloaderViewModel.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/06/2023.
//

import Foundation

class DownloaderViewModel: ObservableObject {

    @Published var beachs: [PixabayItem] = []

    func getBeachPixabay() {
        ApiManager.getPixabay(query: "beach") { [weak self] result in
            guard let this = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let value):
                    this.beachs = value.hits
                }
            }
        }
    }
}
