//
//  CommonError.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 30/05/2023.
//

enum CommonError: Error {
    case error(String)
    case errorURL
    case errorParsing
    case networkError
    case fileNotFound
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error."
        case .errorParsing:
            return "Failed parsing response from server"
        case .networkError:
            return "Error connecting to the server"
        case .fileNotFound:
            return "File not found"
        case .unknown:
            return "Unknown error"
        }
    }
}
