//
//  URLExt.swift
//  SwiftUIApp
//
//  Created by Khoa Vo T.A. VN.Danang on 16/06/2023.
//

import Foundation

import Foundation

extension URL {
    func getQueryStringParameter(param: String) -> String? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else {
                return nil
        }
        return queryItems.first(where: { $0.name == param })?.value
    }
}
