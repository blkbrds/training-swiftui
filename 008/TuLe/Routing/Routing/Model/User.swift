//
//  User.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 22/05/2023.
//

import Foundation

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
    
    func getData() async throws -> [UserContainer] {
        do {
            if fm.fileExists(atPath: getDocumentsDirectory().path) {
                return try await decodeData(fromURL: getDocumentsDirectory().appendingPathExtension("user.json"))
            } else {
                return try await decodeData(fromURL: mainUrl)
            }
        } catch {
            throw error
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    @MainActor
    func decodeData(fromURL url: URL) async throws -> [UserContainer] {
        do{
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let userContainer = try decoder.decode([UserContainer].self, from: jsonData)
            self.userContainer = userContainer
            return userContainer
        } catch {
            throw error
        }
    }
    
    func writeToFile() {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(userContainer)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                try jsonString.write(to: getDocumentsDirectory().appendingPathExtension("user.json"), atomically: true, encoding: .utf8)
                print("\(getDocumentsDirectory().appendingPathExtension("user.json"))")
                print("save thành công")
            }
        } catch { }
    }
}
