//
//  DeeplinkManager.swift
//  BaiTap2
//
//  Created by Tu Le C. [2] VN.Danang on 13/02/2023.
//

import SwiftUI

class DeeplinkManager {
    
    enum DeeplinkTarget: Equatable {
        case home(name: String)
        case details(name: String)
    }
    
    class DeepLinkConstants {
        static let scheme = "tuleapp"
        static let host = "tuleapp.com"
        static let detailsPath = "/details"
        static let query = "name"
    }
    
    func manage(_ url: URL) -> DeeplinkTarget {
        guard url.scheme == DeepLinkConstants.scheme,
              url.host == DeepLinkConstants.host,
              url.path == DeepLinkConstants.detailsPath
        else { return .home(name: url.valueOf("name") ?? "") }
        
        return .details(name: url.valueOf("name") ?? "")
    }
}

extension URL {
    func valueOf(_ queryParameterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParameterName })?.value
    }
}
