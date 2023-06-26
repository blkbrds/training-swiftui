//
//  User.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 22/05/2023.
//

import Foundation

enum APIResult<Value> {
    case success(Value)
    case failure(Error)
}

struct UserContainer: Codable {
    var user: User?
    
    func saveData() -> Data? {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(self)
        return data
    }
}

struct User: Codable {
    var email: String?
    var userName: String?
    var password: String?
}

class JSONProvider: ObservableObject {
    
    @Published var userContainer: [UserContainer] = []
    private var fm = FileManager.default
    private let mainUrl: URL = Bundle.main.url(forResource: "user", withExtension: "json") ?? URL(filePath: "")
    
    func getData() async -> APIResult<[UserContainer]> {
        do {
            try? await Task.sleep(until: .now + .seconds(3), clock: .continuous)
            if fm.fileExists(atPath: try getDocumentsDirectory().path) {
                return try await .success(decodeData(fromURL: getDocumentsDirectory().appendingPathExtension("user.json")))
            } else {
                return try await .success(decodeData(fromURL: mainUrl))
            }
        } catch {
            return .failure(error)
        }
    }
    
    func getDocumentsDirectory() throws -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        if paths.isEmpty {
            throw CommonError.errorURL
        } else {
            return paths[0]
        }
    }

    func decodeData(fromURL url: URL) async throws -> [UserContainer] {
        do{
            let jsonData = try getDataJsonFile(url: url)
            let decoder = JSONDecoder()
            let userContainer = try decoder.decode([UserContainer].self, from: jsonData)
            self.userContainer = userContainer
            return userContainer
        } catch CommonError.fileNotFound {
            throw CommonError.fileNotFound
        } catch {
            throw CommonError.errorParsing
        }
    }
    
    func getDataJsonFile(url: URL) throws -> Data {
        do {
            let jsonData = try Data(contentsOf: url)
            return jsonData
        } catch {
            throw CommonError.fileNotFound
        }
    }
    
    func writeToFile() {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(userContainer)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                try jsonString.write(to: getDocumentsDirectory().appendingPathExtension("user.json"), atomically: true, encoding: .utf8)
            }
        } catch { }
    }
}