//
//  PixabayCelViewModel.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/06/2023.
//

import Foundation
import SwiftUI

class PixabayCellViewModel: ObservableObject {

    @Published var image: Image?
    @Published var isLoading: Bool = true

    func loadImage(url: String) {
        Downloader.downloadImage(url: url) { [weak self] result in
            guard let this = self else { return }
            DispatchQueue.main.async {
                this.isLoading = false
                guard let result = result else {
                    return
                }
                this.image = Image(uiImage: result)
            }
        }
    }
}
