//
//  Downloader.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/06/2023.
//

import Foundation
import SwiftUI

class Downloader {

    static func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }
            .resume()
    }
}
